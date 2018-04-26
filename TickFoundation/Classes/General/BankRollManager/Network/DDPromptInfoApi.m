//
//  DDPromptInfoApi.m
//  DidaShipper
//
//  Created by yangbo on 17/3/18.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDPromptInfoApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDPromptInfoApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.promptInfo";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];

    dic[@"roleType"] = NilToEmptyString(_roleType);
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

- (Class)responseClass{
    return [DDPromptInfoResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSDictionary class]]){
        return;
    }
    
    DDPromptInfoResponse *rsp = (DDPromptInfoResponse *)response;
    rsp.model = [[DDPromptModel alloc] initWithDictionary:data error:nil];
}

@end

@implementation DDPromptInfoResponse

@end
