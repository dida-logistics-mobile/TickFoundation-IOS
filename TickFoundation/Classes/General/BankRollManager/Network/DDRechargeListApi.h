//
//  DDRechargeListApi.h
//  DidaShipper
//
//  Created by 李龙飞 on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseRequest.h>

///充值明细
@interface DDRechargeListApi : BaseRequest

///请求来源（货主：HZF，承运方：CYF，司机：SJF）
@property (nonatomic, strong) NSString *roleType;
///分页起始行
@property (nonatomic) NSInteger fromRow;
///分页间隔
@property (nonatomic) NSInteger toRow;

@property (nonatomic, strong) NSString *status; //00作废，05审核不通过，10待审核，90审核通过 ， 不传：全部


@end

@interface DDRechargeListResponse : BaseResponse

@property (nonatomic, strong)  NSArray *list;

@end
