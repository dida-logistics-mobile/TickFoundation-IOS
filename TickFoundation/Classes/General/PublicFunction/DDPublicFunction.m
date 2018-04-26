//
//  PublicFunction.m
//  Dida
//
//  Created by yangbo on 16/12/27.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import "DDPublicFunction.h"
#import "NSBundle+DDFoundation.h"
#import "LoggerManager.h"

@implementation DDPublicFunction

+ (NSString *)unitWithGoodStyle:(NSString *)goodStyle{
    
    if([goodStyle isEqualToString:GoodStyleZH]){
        return DiDaLocalizedString(@"Ton");
    }else {
        return DiDaLocalizedString(@"Cube");
    }
}

+ (NSString *)priceUnitWithGoodStyle:(NSString *)goodStyle{
    if([goodStyle isEqualToString:GoodStyleZH]){
        return DiDaLocalizedString(@"YuanPerTone");
    }else {
        return DiDaLocalizedString(@"YuanPerCube");
    }
}
    
+(void)callWithPhone:(NSString *)phone view:(UIView *)view{
    if(phone.length == 0){
        DDLogInfo(@"电话|号码为空");
        return;
    }
    NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", phone];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
    });
}

@end
