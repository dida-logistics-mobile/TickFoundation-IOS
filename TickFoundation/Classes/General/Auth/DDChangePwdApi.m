//
//  DDChangePwdApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/27.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDChangePwdApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDChangePwdApi

- (NSString *)requestUrl{
    return @"/dida/admin/modifyPassword";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    [dic addEntriesFromDictionary:_wholeParamDic];
    dic[@"roleType"] = NilToEmptyString(_roleType);
    dic[@"password"] = NilToEmptyString(_password);
    dic[@"verification"] = NilToEmptyString(_verification);
    dic[@"contactTele"] = NilToEmptyString(_contactTele);
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

@end
