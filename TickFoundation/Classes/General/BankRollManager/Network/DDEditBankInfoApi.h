//
//  DDEditBankInfoApi.h
//  DidaShipper
//
//  Created by yangbo on 2017/6/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseRequest.h>
#import "DDBankModel.h"

@interface DDEditBankInfoApi : BaseRequest

@property (nonatomic, strong) NSString *roleType; //请求来源（货主：HZF，承运方：CYF，司机：SJF）
@property (nonatomic, strong) DDBankModel *bankModel;

@end
