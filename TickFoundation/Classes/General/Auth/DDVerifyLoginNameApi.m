//
//  DDVerifyLoginNameApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/27.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDVerifyLoginNameApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDVerifyLoginNameApi

- (NSString *)requestUrl{
    return @"/dida/admin/confirmLoginName";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    [dic addEntriesFromDictionary:_wholeParamDic];
    
    dic[@"roleType"] = NilToEmptyString(_roleType);
    dic[@"loginName"] = NilToEmptyString(_loginName);
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

- (Class)responseClass{
    return [DDVerifyLoginNameResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSDictionary class]])
        return;
    
    DDVerifyLoginNameResponse *rsp = (DDVerifyLoginNameResponse *)response;
    rsp.mobile = data[@"contactTele"];
}

@end

@implementation DDVerifyLoginNameResponse

@end
