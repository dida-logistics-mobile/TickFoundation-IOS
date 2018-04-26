//
//  DDWithdrawApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDWithdrawApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDWithdrawApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.accountWithdraw";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    dic[@"roleType"] = NilToEmptyString(_roleType);
    dic[@"bankId"] = NilToEmptyString(_bankId);
    dic[@"amount"] = NilToEmptyString(_amount);
    dic[@"bankNo"] = NilToEmptyString(_bankNo);
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

@end
