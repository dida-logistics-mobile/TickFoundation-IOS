//
//  DDDeleteBankInfoApi.h
//  DidaShipper
//
//  Created by yangbo on 2017/6/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseRequest.h>

@interface DDDeleteBankInfoApi : BaseRequest

@property (nonatomic, strong) NSString *roleType;
@property (nonatomic, strong) NSString *companyBankId;
@property (nonatomic, strong) NSString *actionType;

@end
