//
//  DDCheckVerifationApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/29.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDCheckVerifationApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDCheckVerifationApi

- (NSString *)requestUrl{
    return @"/dida/admin/checkVerification";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    [dic addEntriesFromDictionary:_wholeParamDic];
    dic[@"roleType"] = NilToEmptyString(_roleType);
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
