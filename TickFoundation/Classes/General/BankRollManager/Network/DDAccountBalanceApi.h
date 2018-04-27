//
//  DDAccountBalanceApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseRequest.h>

///余额查询
@interface DDAccountBalanceApi : BaseRequest

@property (nonatomic, strong) NSString *roleType; //请求来源（货主：HZF，承运方：CYF，司机：SJF）

@end

@interface DDAccountBalanceResponse : BaseResponse

@property (nonatomic) CGFloat userAmount;

@end
