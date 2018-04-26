//
//  DDForgetPwdApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/27.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDForgetPwdApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDForgetPwdApi

- (NSString *)requestUrl{
    return @"/dida/admin/forgetPassword";
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

@end
