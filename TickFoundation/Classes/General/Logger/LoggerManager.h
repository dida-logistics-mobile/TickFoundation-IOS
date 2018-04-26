//
//  LoggerManager.h
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "DDPublicMacro.h"

//修改编译错误
#ifndef LOG_LEVEL_DEF
#define LOG_LEVEL_DEF ddLogLevel
#endif

#ifndef LOG_ASYNC_ENABLED
#define LOG_ASYNC_ENABLED YES
#endif

#ifdef TEST
    #define ddLogLevel  DDLogLevelVerbose
#else
    #define ddLogLevel  DDLogLevelInfo
#endif

@interface LoggerManager : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER

@end

@interface LoggerFormater : NSObject <DDLogFormatter>

@end
