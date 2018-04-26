//
//  DDUploadLogApi.m
//  DidaShipper
//
//  Created by yangbo on 17/4/6.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDUploadLogApi.h"
#import "DDPublicMacro.h"
#import "UIDevice+DDExtension.h"
#import "DDLogModel.h"
#import "DDLogCollection.h"

@implementation DDUploadLogApi

- (NSString *)requestUrl{
    return @"/v1/app/logs";
}

- (NSString *)baseUrl{
    return [DDLogCollection sharedInstance].baseUrl;
}

- (YTKRequestSerializerType)requestSerializerType{
    return YTKRequestSerializerTypeJSON;
}

- (YTKResponseSerializerType)responseSerializerType{
    return YTKResponseSerializerTypeJSON;
}

- (id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    
    NSString *systemName = [UIDevice currentDevice].systemName;
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    dic[@"os"] = [systemName stringByAppendingString:systemVersion];
    dic[@"md"] = NilToEmptyString([UIDevice dd_deviceString]);
    dic[@"pf"] = @1;
    dic[@"ut"] = @(_ut);
    
    NSMutableArray *logArray = [[NSMutableArray alloc] init];
    for(DDLogModel *log in _logs){
        NSDictionary *logDic = @{@"lv":@(log.lv),
                                 @"nt":@(log.nt),
                                 @"ip":@"",
                                 @"lt":@"",
                                 @"uid":NilToEmptyString(log.uid),
                                 @"un":NilToEmptyString(log.un),
                                 @"vs":NilToEmptyString(log.vs),
                                 @"in":NilToEmptyString(log.content),
                                 @"t":IntToString((NSInteger)log.t)};
        [logArray addObject:logDic];
    }
    
    dic[@"log"] = logArray;
    
    return dic;
}

@end
