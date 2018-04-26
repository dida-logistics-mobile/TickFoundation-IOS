//
//  FeedbackApi.m
//  Dida
//
//  Created by yangbo on 17/4/7.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "FeedbackApi.h"
#import "UIDevice+DDExtension.h"
#import <AFNetworking/AFNetworking.h>
#import "DDLogCollection.h"
#import "NSString+Extension.h"

@implementation FeedbackApi

- (NSString *)baseUrl{
    return [DDLogCollection sharedInstance].baseUrl;
}

- (NSString *)requestUrl{
    return @"/v1/app/fba";
}

- (id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    
    NSString *systemName = [UIDevice currentDevice].systemName;
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    dic[@"os"] = [systemName stringByAppendingString:systemVersion];
    dic[@"md"] = NilToEmptyString([UIDevice dd_deviceString]);
    dic[@"nt"] = @([UIDevice dd_networkStatus]);
    dic[@"pf"] = @1;
    dic[@"ut"] = @(_ut);
    dic[@"uid"] = NilToEmptyString(_uid);
    dic[@"un"] = NilToEmptyString(_un);
    dic[@"in"] = NilToEmptyString(_content);
    dic[@"vs"] = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    dic[@"ph"] = NilToEmptyString(_ph);
    dic[@"ip"] = @"";
    
    return dic;
}

-(AFConstructingBlock)constructingBodyBlock{
    return ^(id<AFMultipartFormData> formData){
        if(_f1Path && [[NSFileManager defaultManager] fileExistsAtPath:_f1Path]){
            [formData appendPartWithFileURL:[NSURL fileURLWithPath:_f1Path] name:@"f1" error:nil];
        }
    };
}

- (BaseResponse *)parseResponseData{
    BaseResponse *rsp = [[BaseResponse alloc] init];
    NSDictionary *dic = [self.responseString dd_jsonObject];

    if(![dic isKindOfClass:[NSDictionary class]]){
        rsp.code = 0;
        return rsp;
    }
    
    rsp.code = [dic[@"st"] integerValue];
    rsp.message = dic[@"in"];
    
    return rsp;
}


@end
