//
//  BaseResponse.m
//  VCloudChat
//
//  Created by palmwin on 16/9/19.
//  Copyright © 2016年 Handwin. All rights reserved.
//

#import "BaseResponse.h"
#import "LoggerManager.h"
#import "DDPublicMacro.h"

@implementation BaseResponse

- (void)decodeResponseJsonObject:(NSDictionary *)jsonDic
{
    if(![jsonDic isKindOfClass:[NSDictionary class]])
    {
        DDLogError(@"网络|jsonDic不是字典|jsonDic(%@)",jsonDic);
        return;
    }

    _code = [jsonDic[@"code"] integerValue];
    _message = NullToNil(jsonDic[@"message"]);
    _itemCount = [jsonDic[@"itemCount"] integerValue];
    _authoritys = NullToNil(jsonDic[@"authoritys"]);
}

@end
