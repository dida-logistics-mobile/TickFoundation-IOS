//
//  DDStatistics.m
//  DidaShipper
//
//  Created by yangbo on 17/4/5.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDStatistics.h"
#import <BaiduMobStat/BaiduMobStat.h>
#import "DDStatsEventManager.h"

@implementation DDStatistics

+ (void)startWithAppId:(NSString *)appId version:(NSString *)version debugOn:(BOOL)debugOn{
    [BaiduMobStat defaultStat].shortAppVersion = version;
    [BaiduMobStat defaultStat].enableDebugOn = debugOn;
    if(debugOn){
        [BaiduMobStat defaultStat].channelId = @"Test";
    }
    [[BaiduMobStat defaultStat] startWithAppId:appId];
}

+ (void)logEvent:(NSString *)eventId eventLabel:(NSString *)eventLabel{
    if(eventLabel == nil){
        eventLabel = [[DDStatsEventManager sharedInstance] nameWithStatsId:eventId];
    }
    if(eventLabel == nil)
        return;
    [[BaiduMobStat defaultStat] logEvent:eventId eventLabel:eventLabel];
}

+ (void)pageviewStartWithName:(NSString *)name{
    [[BaiduMobStat defaultStat] pageviewStartWithName:name];
}

+ (void)pageviewEndWithName:(NSString *)name{
    [[BaiduMobStat defaultStat] pageviewEndWithName:name];
}

@end
