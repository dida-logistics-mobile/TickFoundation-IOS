//
//  DDRechargeListApi.m
//  DidaShipper
//
//  Created by 李龙飞 on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDRechargeListApi.h"
#import "DDRechargeModel.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDRechargeListApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.accountRechargeList";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    dic[@"roleType"] = NilToEmptyString(_roleType);
    dic[@"fromRow"] = @(_fromRow);
    dic[@"toRow"] = @(_toRow);
    if(_status){
        dic[@"status"] = _status;
    }
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

- (Class)responseClass{
    return [DDRechargeListResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    
    DDRechargeListResponse *rsp = (DDRechargeListResponse *)response;
    rsp.list = [DDRechargeModel arrayOfModelsFromDictionaries:data error:nil];
}

@end

@implementation DDRechargeListResponse

@end
