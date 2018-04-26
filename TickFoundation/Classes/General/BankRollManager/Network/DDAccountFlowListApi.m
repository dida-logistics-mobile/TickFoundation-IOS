//
//  DDAccountFlowApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/16.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDAccountFlowListApi.h"
#import "DDAccountFlowModel.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDAccountFlowListApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.accountFlow";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    dic[@"roleType"] = NilToEmptyString(_roleType);
    dic[@"fromRow"] = IntToString(_fromRow);
    dic[@"toRow"] = IntToString(_toRow);
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
    return [DDAccountFlowListResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    
    DDAccountFlowListResponse *rsp = (DDAccountFlowListResponse *)response;
    rsp.list = [DDAccountFlowModel arrayOfModelsFromDictionaries:data error:nil];
}


@end

@implementation DDAccountFlowListResponse

@end
