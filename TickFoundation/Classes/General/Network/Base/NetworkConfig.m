//
//  NetworkConfig.m
//  Pods
//
//  Created by yangbo on 16/12/15.
//
//

#import "NetworkConfig.h"
#import <YTKNetwork/YTKNetwork.h>

@implementation NetworkConfig

DEFINE_SINGLETON_FOR_CLASS(NetworkConfig)

- (void)setBaseUrl:(NSString *)url
{
    [[YTKNetworkConfig sharedConfig] setBaseUrl:url];
}

- (void)setCommonRequestArgument:(NSDictionary *)dic{
    _commonRequestArgument = dic;
}

@end
