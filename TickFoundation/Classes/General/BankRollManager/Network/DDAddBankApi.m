//
//  DDAddBankApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDAddBankApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDAddBankApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.addBankAccount";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    dic[@"roleType"] = NilToEmptyString(_roleType);
    dic[@"accountType"] = NilToEmptyString(_bankModel.accountType);
    dic[@"companyTitle"] = NilToEmptyString(_bankModel.companyTitle);
    dic[@"contactTele"] = NilToEmptyString(_bankModel.contactTele);
    if([_bankModel.accountType isEqualToString:@"0"]){
        dic[@"userNo"] = NilToEmptyString(_bankModel.companyNo);
        dic[@"contactName"] = NilToEmptyString(_bankModel.companyTitle);
    }else{
        dic[@"companyNo"] = NilToEmptyString(_bankModel.companyNo);
        dic[@"contactName"] = NilToEmptyString(_bankModel.contactName);
        dic[@"userNo"] = @"";
    }
    dic[@"companyBankName"] = NilToEmptyString(_bankModel.companyBankName);
    dic[@"companyBankNo"] = NilToEmptyString(_bankModel.companyBankNo);
    dic[@"companyBankAddress"] = NilToEmptyString(_bankModel.companyBankAddress);
    dic[@"companyBankZjxx"] = NilToEmptyString(_bankModel.companyBankZjxx);
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

@end
