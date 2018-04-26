//
//  UIDevice+DDIdentifier.m
//  Dida
//
//  Created by yangbo on 16/12/8.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import "UIDevice+DDIdentifier.h"
#import "LoggerManager.h"
#import "NSString+Extension.h"

static NSString *identifierKey = @"identifier";

@implementation UIDevice (DDIdentifier)

+(NSString *)dd_identifier
{
    static NSString *identifier = nil;
    
    if(identifier == nil)
    {
        identifier = [[NSUserDefaults standardUserDefaults] objectForKey:identifierKey];
    }
    
    if(identifier == nil)
    {
        identifier = [NSString dd_randomUUIDString];
        
        if(identifier)
        {
            [[NSUserDefaults standardUserDefaults] setObject:identifier forKey:identifierKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            DDLogError(@"获取设备唯一标识失败");
        }
    }
    
    return identifier;
}

@end
