//
//  DDForgetPwdApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/27.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseRequest.h>

///忘记密码（获取验证码）
@interface DDForgetPwdApi : BaseRequest

@property (nonatomic,strong) NSString *roleType;
@property (nonatomic, strong) NSString *loginName;
@property (nonatomic, strong) NSDictionary *wholeParamDic;

@end
