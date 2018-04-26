//
//  RemoteSourceManager.h
//  DidaShipper
//
//  Created by yangbo on 2017/6/15.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDRemoteSourceManager : NSObject

+ (void)requestVehicleTypes:(void(^)(BOOL success,NSString *error,NSArray *list))rstBlock;
+ (void)requestVehicleLengths:(void(^)(BOOL success,NSString *error,NSArray *list))rstBlock;


@end
