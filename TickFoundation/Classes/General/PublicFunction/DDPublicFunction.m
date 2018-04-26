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
    UIWebView *webview = [[UIWebView alloc] init];
    NSString *number = [NSString stringWithFormat:@"tel:%@",phone];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:number]]];
    [view addSubview:webview];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [webview removeFromSuperview];
    });
}

@end
