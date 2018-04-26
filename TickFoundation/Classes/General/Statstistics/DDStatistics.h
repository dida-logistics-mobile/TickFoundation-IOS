//
//  DDStatistics.h
//  DidaShipper
//
//  Created by yangbo on 17/4/5.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDStatistics : NSObject

+ (void)startWithAppId:(NSString *)appId version:(NSString *)version debugOn:(BOOL)debugOn;

+ (void)logEvent:(NSString *)eventId eventLabel:(NSString *)eventLabel;

+ (void)pageviewStartWithName:(NSString *)name;

+ (void)pageviewEndWithName:(NSString *)name;

@end
