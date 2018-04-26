//
//  DDLogModel.h
//  DidaShipper
//
//  Created by yangbo on 17/4/5.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIDevice+DDExtension.h"

typedef NS_ENUM(NSUInteger, DidaLogLevel) {
    DDLogSeriousException, //严重异常
    DDLogException, //异常
    DDLogWarning, //警告
    DDLogDebug, //调试
    DDLogTrace, //记录追踪
    DDLogCommon, //普通日志
};

typedef NS_ENUM(NSUInteger, DDLogStatus) {
    DDLogNotUpload,
    DDLogUploading,
};

@interface DDLogModel : NSObject

@property (nonatomic) NSInteger logId;
@property (nonatomic) DidaLogLevel lv; //0:严重异常, 1:异常,2:警告,3:调试,4:记录追踪,5:普通日志
@property (nonatomic) DDNetworkType nt; // 0:"" ,1: wifi,2,5G, 3: 4G,4: 3G，5:2G
@property (nonatomic, strong) NSString *ip;
@property (nonatomic, strong) NSString *lt;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *un;
@property (nonatomic, strong) NSString *vs;
@property (nonatomic, strong) NSString *content;
@property (nonatomic) NSTimeInterval t;
@property (nonatomic) DDLogStatus status;

@end
