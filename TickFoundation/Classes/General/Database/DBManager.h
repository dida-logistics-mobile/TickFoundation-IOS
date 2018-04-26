//
//  DBManager.h
//  VCloudChat
//
//  Created by palmwin on 16/9/12.
//  Copyright © 2016年 Handwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>
#import "DDPublicMacro.h"

///数据库管理类
@interface DBManager : NSObject

@property (nonatomic, strong) FMDatabaseQueue *queue;

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER

///打开数据库
- (BOOL)openDatabaseWithPath:(NSString *)path;

///数据库版本检查
- (void)checkUpgradeWithCurrentVersion:(NSInteger)dbVersion upgradeBlock:(void(^)(NSInteger oldVersion))block;

///关闭数据库
- (void)closeDatabase;

@end
