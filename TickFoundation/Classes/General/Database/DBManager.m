//
//  DBManager.m
//  VCloudChat
//
//  Created by palmwin on 16/9/12.
//  Copyright © 2016年 Handwin. All rights reserved.
//

#import "DBManager.h"
#import "LoggerManager.h"

@implementation DBManager

DEFINE_SINGLETON_FOR_CLASS(DBManager)

- (BOOL)openDatabaseWithPath:(NSString *)path
{
    DDLogInfo(@"数据库|打开|path(%@)",path);
    
    if(path.length == 0)
    {
        DDLogError(@"数据库|打开|path为nil");
        return NO;
    }
    
    if(_queue)
    {
        if([_queue.path isEqualToString:path])
        {
            DDLogError(@"数据库|当前数据库已经打开");
            return YES;
        }
        
        [self closeDatabase];
    }
    
    _queue = [FMDatabaseQueue databaseQueueWithPath:path];
    
    if(_queue == nil)
    {
        DDLogError(@"数据库|打开|初始化失败");
        return NO;
    }
    
    [_queue inDatabase:^(FMDatabase *db) {
        [db setShouldCacheStatements:YES];
    }];
    
    return YES;
}

- (void)checkUpgradeWithCurrentVersion:(NSInteger)dbVersion upgradeBlock:(void (^)(NSInteger))block
{
    DDLogInfo(@"数据库");
    
    NSInteger oldVersion = [self getDbVersion];
    
    if (oldVersion == dbVersion) {
        DDLogInfo(@"数据库|已是最新");
        return;
    }
    
    if(block)
        block(oldVersion);
    
    [self setDbVersion:dbVersion];}

- (void)closeDatabase
{
    DDLogInfo(@"数据库|关闭|currentPath(%@)",_queue.path);
    [_queue close];
    _queue = nil;
}

- (void)setDbVersion:(NSInteger)version
{
    [_queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSString *createSql = @"CREATE TABLE IF NOT EXISTS DbInfoTable (key VARCHAR PRIMARY KEY,info TINYINT)";
        [db executeUpdate:createSql];
        NSString *versionSql = @"INSERT OR REPLACE INTO DbInfoTable (key,info) VALUES (?,?)";
        [db executeUpdate:versionSql,@"version",@(version)];
    }];
}

- (NSInteger)getDbVersion
{
    __block NSInteger version = 1; //数据库版本从1开始
    [_queue inDatabase:^(FMDatabase *db) {
        NSString *versionSql = @"select * from DbInfoTable where key = 'version'";
        [db executeStatements:versionSql withResultBlock:^int(NSDictionary *resultsDictionary) {
            if(resultsDictionary[@"info"])
            {
                version = [resultsDictionary[@"info"] integerValue];
            }
            return 0;
        }];
    }];
    
    return version;
}

@end
