//
//  NetworkConfig.h
//  Pods
//
//  Created by yangbo on 16/12/15.
//
//

#import <Foundation/Foundation.h>
#import "DDPublicMacro.h"

///网络配置类
@interface NetworkConfig : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSDictionary *commonRequestArgument;

- (void)setBaseUrl:(NSString *)url;

- (void)setCommonRequestArgument:(NSDictionary *)dic;

@end
