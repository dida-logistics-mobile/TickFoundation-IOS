//
//  BaseRequest.m
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import "BaseRequest.h"
#import "UIDevice+DDIdentifier.h"
#import "DDSecurity.h"
#import "NetworkConfig.h"
#import "NSDate+Extension.h"
#import "NSString+Extension.h"
#import "LoggerManager.h"
#import "DDNotifications.h"

NSInteger successCode = 1; //成功
NSInteger failureCode = 0; //失败
NSInteger alreadyExistCode = 15; //已存在
NSInteger notLoginCode = 999; //未登录
NSInteger notInfoAdd = 120; //未维护
NSInteger notInfoAudit = 130; //未审核
NSInteger dialogCode = 140; //对话框

NSInteger networkErrorCode = -100; //网络错误

@implementation BaseRequest

-(YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

- (YTKRequestSerializerType)requestSerializerType{
    return YTKRequestSerializerTypeHTTP;
}

- (YTKResponseSerializerType)responseSerializerType{
    return YTKResponseSerializerTypeHTTP;
}

- (Class)responseClass
{
    return [BaseResponse class];
}

- (BaseResponse *)parseResponseData
{
    return [self decodeWithResponseClass:self.responseClass];
}

- (BaseResponse *)decodeWithResponseClass:(Class)class
{
    NSDictionary *dic = [self.responseString dd_jsonObject];
    BaseResponse *response = [[class alloc] init];
    [response decodeResponseJsonObject:dic];
    
    if(response.code != successCode)
    {
        DDLogInfo(@"网络请求|code=%ld|%@",response.code,dic);
        if(response.code == notLoginCode){
            [[NSNotificationCenter defaultCenter] postNotificationName:DDNotLoginNotification
                                                                object:nil];
        }
        return response;
    }
    
    NSString *dataStr = dic[@"data"];
    if(![dataStr isKindOfClass:[NSString class]]){
        return response;
    }
    [self decodeData:[dataStr dd_jsonObject] response:response];
    
    return response;
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    
}

@end
