//
//  DDChangePwdApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/27.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseRequest.h>

///修改密码
@interface DDChangePwdApi : BaseRequest

@property (nonatomic,strong) NSString *roleType;
@property (nonatomic, strong) NSString *contactTele;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *verification;
@property (nonatomic, strong) NSDictionary *wholeParamDic;

@end
