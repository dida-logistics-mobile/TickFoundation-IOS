//
//  DDBankAccountListApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDBankAccountListApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDBankAccountListApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.bankAccountList";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    dic[@"roleType"] = NilToEmptyString(_roleType);
    dic[@"fromRow"] = IntToString(_fromRow);
    dic[@"toRow"] = IntToString(_toRow);
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

- (Class)responseClass{
    return [DDBankAccountListResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    DDBankAccountListResponse *rsp = (DDBankAccountListResponse *)response;
    rsp.list = [DDBankModel arrayOfModelsFromDictionaries:data error:nil];
}

@end

@implementation DDBankAccountListResponse

@end
