//
//  LoggerManager.m
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import "LoggerManager.h"

@implementation LoggerManager

DEFINE_SINGLETON_FOR_CLASS(LoggerManager)

- (instancetype)init
{
    if(self = [super init])
    {
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
        [DDTTYLogger sharedInstance].logFormatter = [[LoggerFormater alloc] init];
        
        DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
        fileLogger.rollingFrequency = 60*60*24;
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
        [fileLogger setLogFormatter:[[LoggerFormater alloc] init]];
        [DDLog addLogger:fileLogger];
        NSLog(@"%@",fileLogger.currentLogFileInfo.filePath);
    }
    return self;
}

@end

@implementation LoggerFormater

-(NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *fileName = [logMessage.file lastPathComponent];
    return [NSString stringWithFormat:@"[%@ %lu]: %@ %@", fileName, (unsigned long)logMessage.line, logMessage.function, logMessage.message];
}

@end
