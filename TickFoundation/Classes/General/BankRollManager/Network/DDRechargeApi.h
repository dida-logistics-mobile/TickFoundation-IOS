//
//  DDRechargeApi.h
//  DidaShipper
//
//  Created by 李龙飞 on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseRequest.h>

///充值
@interface DDRechargeApi : BaseRequest

///请求来源（货主：HZF，承运方：CYF，司机：SJF）
@property (nonatomic, strong) NSString *roleType;
///充值金额
@property (nonatomic, strong) NSString *amount;
///备注
@property (nonatomic, strong) NSString *remark;
///转账截图
@property (nonatomic, strong) NSString *bankAmountPic;

@property (nonatomic, strong) NSString *contactTele;

@end
