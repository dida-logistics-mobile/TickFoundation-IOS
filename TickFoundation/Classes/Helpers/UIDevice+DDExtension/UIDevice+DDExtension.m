//
//  UIDevice+DDExtension.m
//  Pods
//
//  Created by yangbo on 17/4/7.
//
//

#import "UIDevice+DDExtension.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <sys/utsname.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>

@implementation UIDevice (DDExtension)

+ (DDNetworkType)dd_networkStatus
{
    switch ([[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus]) {
        case AFNetworkReachabilityStatusReachableViaWWAN:
        {
            NSArray *typeStrings2G = @[CTRadioAccessTechnologyEdge,
                                       CTRadioAccessTechnologyGPRS,
                                       CTRadioAccessTechnologyCDMA1x];
            
            NSArray *typeStrings3G = @[CTRadioAccessTechnologyHSDPA,
                                       CTRadioAccessTechnologyWCDMA,
                                       CTRadioAccessTechnologyHSUPA,
                                       CTRadioAccessTechnologyCDMAEVDORev0,
                                       CTRadioAccessTechnologyCDMAEVDORevA,
                                       CTRadioAccessTechnologyCDMAEVDORevB,
                                       CTRadioAccessTechnologyeHRPD];
            
            NSArray *typeStrings4G = @[CTRadioAccessTechnologyLTE];
            
            if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
                CTTelephonyNetworkInfo *teleInfo= [[CTTelephonyNetworkInfo alloc] init];
                NSString *accessString = teleInfo.currentRadioAccessTechnology;
                if ([typeStrings4G containsObject:accessString]) {
                    return DD4G;
                } else if ([typeStrings3G containsObject:accessString]) {
                    return DD3G;
                } else if ([typeStrings2G containsObject:accessString]) {
                    return DD2G;
                } else {
                    return DDNetworkUnknown;
                }
            } else {
                return DDNetworkUnknown;
            }
        }
            break;
        case AFNetworkReachabilityStatusReachableViaWiFi:
            return DDWifi;
            break;
        case AFNetworkReachabilityStatusNotReachable:
            return DDNetworkUnknown;
        default:
            return DDNetworkUnknown;
            break;
    }
}

+ (NSString *)dd_deviceString{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceString;
}

@end
