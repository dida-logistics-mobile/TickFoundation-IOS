//
//  RemoteSourceManager.m
//  DidaShipper
//
//  Created by yangbo on 2017/6/15.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDRemoteSourceManager.h"
#import "DDVehicleTypeListApi.h"
#import "DDVehicleLengthListApi.h"

@implementation DDRemoteSourceManager

+ (void)requestVehicleTypes:(void(^)(BOOL success,NSString *error,NSArray *list))rstBlock{
    DDVehicleTypeListApi *api = [[DDVehicleTypeListApi alloc] init];
    [api startWithCompletionBlockWithSuccess:^(DDVehicleTypeListApi* request) {
        DDVehicleTypeListResponse *rsp = (DDVehicleTypeListResponse *)[request parseResponseData];
        if(rsp.code == successCode){
            if(rstBlock){
                rstBlock(YES,nil,rsp.list);
            }
        }else{
            if(rstBlock){
                rstBlock(NO,rsp.message,nil);
            }
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        if(rstBlock){
            rstBlock(NO,@"网络不通，请检查网络设置",nil);
        }
    }];
}

+ (void)requestVehicleLengths:(void(^)(BOOL success,NSString *error,NSArray *list))rstBlock{
    DDVehicleLengthListApi *api = [[DDVehicleLengthListApi alloc] init];
    [api startWithCompletionBlockWithSuccess:^(DDVehicleTypeListApi* request) {
        DDVehicleLengthListResponse *rsp = (DDVehicleLengthListResponse *)[request parseResponseData];
        if(rsp.code == successCode){
            if(rstBlock){
                rstBlock(YES,nil,rsp.list);
            }
        }else{
            if(rstBlock){
                rstBlock(NO,rsp.message,nil);
            }
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        if(rstBlock){
            rstBlock(NO,@"网络不通，请检查网络设置",nil);
        }
    }];
}


@end
