//
//  DDVerifyLoginNameApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/27.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseRequest.h>

///忘记密码验证帐户
@interface DDVerifyLoginNameApi : BaseRequest

@property (nonatomic,strong) NSString *roleType;
@property (nonatomic, strong) NSString *loginName;
@property (nonatomic, strong) NSDictionary *wholeParamDic;

@end

@interface DDVerifyLoginNameResponse : BaseResponse

@property (nonatomic, strong) NSString *mobile;

@end
