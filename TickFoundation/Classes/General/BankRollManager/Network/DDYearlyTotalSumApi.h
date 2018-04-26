//
//  DDYearlyTotalSumApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseRequest.h>

///年度成交额
@interface DDYearlyTotalSumApi : BaseRequest

@property (nonatomic, strong) NSString *roleType; //请求来源（货主：HZF，承运方：CYF，司机：SJF）

@end

@interface DDYearlyTotalSumResponse : BaseResponse

@property (nonatomic, strong) NSString *yearlyTotalSum;
@property (nonatomic, strong) NSString *roleType; //请求者身份（1：企业承运方 2：个体承运方）

@end
