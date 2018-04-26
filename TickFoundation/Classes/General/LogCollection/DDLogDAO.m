//
//  DDLogDAO.m
//  DidaShipper
//
//  Created by yangbo on 17/4/6.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDLogDAO.h"

@implementation DDLogDAO
{
    DBManager *_dbManager;
}

- (instancetype)initWithDbManager:(DBManager *)manager{
    if(self = [super init]){
        _dbManager = manager;
    }
    return self;
}

- (BOOL)insertLog:(DDLogModel *)model{
    __block BOOL success = NO;
    [_dbManager.queue inDatabase:^(FMDatabase *db) {
        NSString *sql = @"INSERT INTO Logs(lv,nt,ip,lt,uid,un,vs,t,content,status) VALUES (?,?,?,?,?,?,?,?,?,?)";
        success = [db executeUpdate:sql,
                   @(model.lv),
                   @(model.nt),
                   model.ip,
                   model.lt,
                   model.uid,
                   model.un,
                   model.vs,
                   @(model.t),
                   model.content,
                   @(model.status)];
    }];
    return success;
}

- (void)updateLogs:(NSArray *)logs status:(DDLogStatus)status{
    [_dbManager.queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSString *sql = @"UPDATE Logs SET status = ? WHERE log_id = ?";
        for(DDLogModel *model in logs){
            [db executeUpdate:sql,@(status),@(model.logId)];
        }
    }];
}

- (BOOL)deleteLogWithStatus:(DDLogStatus)status{
    __block BOOL success = NO;
    [_dbManager.queue inDatabase:^(FMDatabase *db) {
        NSString *sql = @"DELETE FROM Logs WHERE status = ?";
        success = [db executeUpdate:sql,@(status)];
    }];
    return success;
}

- (NSArray *)getLogsWithStatus:(DDLogStatus)status{
    
    __block NSMutableArray *array = [[NSMutableArray alloc] init];
    [_dbManager.queue inDatabase:^(FMDatabase *db) {
        NSString *sql = [NSString stringWithFormat:@"SELECT * FROM Logs WHERE status = %ld",status];
        [db executeStatements:sql withResultBlock:^int(NSDictionary *resultsDictionary) {
            [array addObject:[self logWithDic:resultsDictionary]];
            return 0;
        }];
    }];
    return array;
}

- (DDLogModel *)logWithDic:(NSDictionary *)dic{
    DDLogModel *model = [[DDLogModel alloc] init];
    model.logId = [dic[@"log_id"] integerValue];
    model.lv = [dic[@"lv"] integerValue];
    model.nt = [dic[@"nt"] integerValue];
    model.ip = NullToNil(dic[@"ip"]);
    model.lt = NullToNil(dic[@"lt"]);
    model.uid = NullToNil(dic[@"uid"]);
    model.un = NullToNil(dic[@"un"]);
    model.vs = NullToNil(dic[@"vs"]);
    model.t = [dic[@"t"] doubleValue];
    model.content = NullToNil(dic[@"content"]);
    model.status = [dic[@"status"] integerValue];
    
    return model;
}

@end
