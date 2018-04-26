//
//  DDDrawListApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/16.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDWithDrawListApi.h"
#import "DDWithDrawModel.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDWithDrawListApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.accountWithdrawList";
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
    return [DDWithDrawListResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    
    DDWithDrawListResponse *rsp = (DDWithDrawListResponse *)response;
    rsp.list = [DDWithDrawModel arrayOfModelsFromDictionaries:data error:nil];
}


@end

@implementation DDWithDrawListResponse

@end
