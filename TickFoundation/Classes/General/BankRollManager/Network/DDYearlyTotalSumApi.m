//
//  DDYearlyTotalSumApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDYearlyTotalSumApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDYearlyTotalSumApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.yearlyTotalSum";
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
    return [DDYearlyTotalSumResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSDictionary class]]){
        return;
    }
    DDYearlyTotalSumResponse *rsp = (DDYearlyTotalSumResponse *)response;
    rsp.yearlyTotalSum = data[@"yearlyTotalSum"];
    rsp.roleType = data[@"roleType"];
}

@end

@implementation DDYearlyTotalSumResponse

@end
