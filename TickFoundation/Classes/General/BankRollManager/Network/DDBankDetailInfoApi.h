//
//  DDBankDetailInfoApi.h
//  Pods
//
//  Created by yangbo on 2017/6/17.
//
//

#import <TickFoundation/BaseRequest.h>
#import "DDBankModel.h"

@interface DDBankDetailInfoApi : BaseRequest

@property (nonatomic, strong) NSString *roleType; //请求来源（货主：HZF，承运方：CYF，司机：SJF）
@property (nonatomic, strong) NSString *companyBankId;

@end

@interface DDBankDetailInfoResponse : BaseResponse

@property (nonatomic, strong) DDBankModel *model;

@end
