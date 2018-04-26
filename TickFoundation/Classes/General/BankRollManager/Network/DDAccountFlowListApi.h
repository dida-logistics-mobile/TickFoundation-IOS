//
//  DDAccountFlowApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/16.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseRequest.h>

///交易流水
@interface DDAccountFlowListApi : BaseRequest

///请求来源（货主：HZF，承运方：CYF，司机：SJF）
@property (nonatomic, strong) NSString *roleType;
///分页起始行
@property (nonatomic) NSInteger fromRow;
///分页间隔
@property (nonatomic) NSInteger toRow;

@property (nonatomic, strong) NSString *status; //10：充值, 20：提现, 30：支出, 40：收入, 50：返利  60：贴息, 70:其他, 80:综合费用， 不传：全部

@end

@interface DDAccountFlowListResponse :BaseResponse

@property (nonatomic, strong) NSArray *list;

@end
