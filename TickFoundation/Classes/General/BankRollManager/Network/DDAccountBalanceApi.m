//
//  DDAccountBalanceApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDAccountBalanceApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDAccountBalanceApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.accountBalance";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    dic[@"roleType"] = NilToEmptyString(_roleType);
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

- (Class)responseClass{
    return [DDAccountBalanceResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSDictionary class]]){
        return;
    }
    DDAccountBalanceResponse *rsp = (DDAccountBalanceResponse *)response;
    rsp.userAmount = [data[@"userAmount"] doubleValue];
}

@end

@implementation DDAccountBalanceResponse

@end
