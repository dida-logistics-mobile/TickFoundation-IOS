//
//  DDBankAccountListApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseRequest.h>
#import "DDBankModel.h"

///银行账户列表
@interface DDBankAccountListApi : BaseRequest

@property (nonatomic, strong) NSString *roleType; //请求来源（货主：HZF，承运方：CYF，司机：SJF）
@property (nonatomic) NSInteger fromRow;
@property (nonatomic) NSInteger toRow;

@end

@interface DDBankAccountListResponse : BaseResponse

@property (nonatomic, strong)  NSArray *list;

@end
