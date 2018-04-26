//
//  DDVehicleTypeListApi.h
//  DidaShipper
//
//  Created by yangbo on 2017/6/15.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseRequest.h>

@interface DDVehicleTypeListApi : BaseRequest

@end

@interface DDVehicleTypeListResponse : BaseResponse

@property (nonatomic, strong) NSArray *list;

@end
