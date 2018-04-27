//
//  DDLogCollection.m
//  DidaShipper
//
//  Created by yangbo on 17/4/5.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDLogCollection.h"
#import <TickFoundation/DBManager.h>
#import "DDLogDAO.h"
#import "DDUploadLogApi.h"
#import <AFNetworking/AFNetworking.h>
#import "LoggerManager.h"

@implementation DDLogCollection
{
    NSMutableArray  *_logs;
    DBManager       *_dbManager;
    DDLogDAO        *_dao;
}

DEFINE_SINGLETON_FOR_CLASS(DDLogCollection)

- (instancetype)init{
    if(self = [super init]){
        _dbManager = [[DBManager alloc] init];
        NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"logs.sqlite"];
        BOOL success = [_dbManager openDatabaseWithPath:path];
        if(success){
            [self createTableIfNotExist];
        }
        
        _dao = [[DDLogDAO alloc] initWithDbManager:_dbManager];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    
    return self;
}

- (void)applicationDidEnterBackground:(NSNotification *)notifications{
    [self uploadLogs];
}

- (void)createTableIfNotExist{
    [_dbManager.queue inDatabase:^(FMDatabase *db) {
        NSString *tableSql = @"CREATE TABLE IF NOT EXISTS Logs (log_id INTEGER PRIMARY KEY AUTOINCREMENT,\
        lv TINYINT,\
        nt TINYINT,\
        ip VARCHAR,\
        lt VARCHAR,\
        uid VARCHAR,\
        un VARCHAR,\
        vs VARCHAR,\
        t DOUBLE,\
        content VARCHAR,\
        status TINYINT)";
        [db executeUpdate:tableSql];
    }];
}

- (void)addLog:(DDLogModel *)model{
    if(model == nil)
        return;
    [_dao insertLog:model];
}

- (void)uploadLogs{
    NSArray *logs = [_dao getLogsWithStatus:DDLogNotUpload];
    
    if(logs.count == 0){
        return;
    }
    
    [_dao updateLogs:logs status:DDLogUploading];
    
    DDUploadLogApi *api = [[DDUploadLogApi alloc] init];
    api.logs = logs;
    api.ut = _ut;
    
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        [_dao deleteLogWithStatus:DDLogUploading];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        DDLogInfo(@"日志上传失败error(%@)",request.error);
    }];
}

- (void)addApiErrorWithUrl:(NSString *)url desc:(NSString *)desc{
    DDLogModel *model = [[DDLogModel alloc] init];
    model.lv = DDLogWarning;
    model.nt = [UIDevice dd_networkStatus];
    model.uid = _uid;
    model.un = _un;
    model.vs = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    model.t = [[NSDate date] timeIntervalSince1970]*1000;
    model.status = DDLogNotUpload;
    
    NSDictionary *jsonDic = @{@"url":NilToEmptyString(url),
                              @"type":@"api",
                              @"desc":NilToEmptyString(desc)};
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *content = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    model.content = content;
    
    [_dao insertLog:model];
}

- (void)addApiAckTimeWithUrl:(NSString *)url seconds:(NSTimeInterval)seconds{
    DDLogModel *model = [[DDLogModel alloc] init];
    model.lv = DDLogWarning;
    model.nt = [UIDevice dd_networkStatus];
    model.uid = _uid;
    model.un = _un;
    model.vs = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    model.t = [[NSDate date] timeIntervalSince1970]*1000;
    model.status = DDLogNotUpload;
    
    NSDictionary *jsonDic = @{@"url":NilToEmptyString(url),
                              @"type":@"api_ack_time",
                              @"seconds":@(seconds)};
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *content = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    model.content = content;
    
    [_dao insertLog:model];
}

@end
