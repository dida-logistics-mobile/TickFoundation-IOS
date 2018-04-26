//
//  DDLogDAO.h
//  DidaShipper
//
//  Created by yangbo on 17/4/6.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DiDaFoundation/DBManager.h>
#import "DDLogModel.h"

///日志数据库
@interface DDLogDAO : NSObject

- (instancetype)initWithDbManager:(DBManager *)manager;

- (BOOL)insertLog:(DDLogModel *)model;

- (void)updateLogs:(NSArray *)logs status:(DDLogStatus)status;

- (BOOL)deleteLogWithStatus:(DDLogStatus)status;

- (NSArray *)getLogsWithStatus:(DDLogStatus)status;

@end
