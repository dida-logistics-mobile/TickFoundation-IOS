//
//  DDDeleteBankInfoApi.m
//  DidaShipper
//
//  Created by yangbo on 2017/6/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDDeleteBankInfoApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDDeleteBankInfoApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.accountInfoDel";
}

- (id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    dic[@"roleType"] = NilToEmptyString(_roleType);
    dic[@"companyBankId"] = NilToEmptyString(_companyBankId);
    dic[@"actionType"] = NilToEmptyString(_actionType);
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

@end
