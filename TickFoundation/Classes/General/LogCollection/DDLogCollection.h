//
//  DDLogCollection.h
//  DidaShipper
//
//  Created by yangbo on 17/4/5.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLogModel.h"
#import "DDPublicMacro.h"

///日志收集
@interface DDLogCollection : NSObject

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *un;
@property (nonatomic) NSInteger ut; //1:货主,2:司机,3:承运
@property (nonatomic, strong) NSString *baseUrl;

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER

- (void)addLog:(DDLogModel *)model;

- (void)uploadLogs;

- (void)addApiErrorWithUrl:(NSString *)url desc:(NSString *)desc;

- (void)addApiAckTimeWithUrl:(NSString *)url seconds:(NSTimeInterval)seconds;

@end
