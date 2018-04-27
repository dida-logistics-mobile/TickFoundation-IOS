//
//  DDAddBankApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseRequest.h>
#import "DDBankModel.h"

///银行账户新增
@interface DDAddBankApi : BaseRequest

@property (nonatomic, strong) NSString *roleType; //请求来源（货主：HZF，承运方：CYF，司机：SJF）
@property (nonatomic, strong) DDBankModel *bankModel;

@end
