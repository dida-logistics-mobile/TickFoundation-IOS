//
//  DDVehicleTypeListApi.m
//  DidaShipper
//
//  Created by yangbo on 2017/6/15.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDVehicleTypeListApi.h"
#import "NSString+Extension.h"

@implementation DDVehicleTypeListApi

- (NSString *)requestUrl{
    return @"/dida/admin/typeList";
}

- (id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

- (Class)responseClass{
    return [DDVehicleTypeListResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    
    DDVehicleTypeListResponse *rsp = (DDVehicleTypeListResponse *)response;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(NSDictionary *dic in data){
        if(dic[@"style_desc"])
            [array addObject:dic[@"style_desc"]];
    }
    rsp.list = array;
}

@end

@implementation DDVehicleTypeListResponse

@end
