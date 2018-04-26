//
//  DDRechargeApi.m
//  DidaShipper
//
//  Created by 李龙飞 on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDRechargeApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDRechargeApi


- (NSString *)requestUrl{
    return @"/dida/admin/capital.accountRecharge";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    dic[@"roleType"] = NilToEmptyString(_roleType);
    dic[@"amount"] = NilToEmptyString(_amount);
    dic[@"remark"] = NilToEmptyString(_remark);
    if(_bankAmountPic){
        dic[@"bankAmountPic"] = NilToEmptyString(_bankAmountPic);
    }
    if(_contactTele){
        dic[@"contactTele"] = _contactTele;
    }
    dic[@"imageTransfer"] = @"1";
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}


@end
