//
//  DDWithdrawApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseRequest.h>

///新增提现
@interface DDWithdrawApi : BaseRequest

@property (nonatomic, strong) NSString *roleType; //请求来源（货主：HZF，承运方：CYF，司机：SJF）
@property (nonatomic, strong) NSString *bankId; //收款账户id
@property (nonatomic, strong) NSString *amount; //提现金额
@property (nonatomic, strong) NSString *bankNo; //银行卡账号

@end
