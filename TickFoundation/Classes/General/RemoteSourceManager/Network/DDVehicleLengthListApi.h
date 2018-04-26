//
//  DDVehicleLengthListApi.h
//  DidaShipper
//
//  Created by yangbo on 2017/6/15.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseRequest.h>

@interface DDVehicleLengthListApi : BaseRequest

@end

@interface DDVehicleLengthListResponse : BaseResponse

@property (nonatomic, strong) NSArray *list;

@end
