//
//  DDVehicleLengthListApi.m
//  DidaShipper
//
//  Created by yangbo on 2017/6/15.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDVehicleLengthListApi.h"
#import "NSString+Extension.h"

@implementation DDVehicleLengthListApi

- (NSString *)requestUrl{
    return @"/dida/admin/lengthList";
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
    return [DDVehicleLengthListResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSArray class]]){
        return;
    }
    
    DDVehicleLengthListResponse *rsp = (DDVehicleLengthListResponse *)response;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(NSDictionary *dic in data){
        if(dic[@"length"])
            [array addObject:[NSString stringWithFormat:@"%@",dic[@"length"]]];
    }
    rsp.list = array;
}

@end

@implementation DDVehicleLengthListResponse

@end
