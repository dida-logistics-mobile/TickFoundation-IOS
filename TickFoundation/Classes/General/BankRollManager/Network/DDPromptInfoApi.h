//
//  DDPromptInfoApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/18.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseRequest.h>
#import "DDPromptModel.h"

///公司账户信息
@interface DDPromptInfoApi : BaseRequest

@property (nonatomic, strong) NSString *roleType;

@end

@interface DDPromptInfoResponse : BaseResponse

@property (nonatomic, strong) DDPromptModel *model;

@end
