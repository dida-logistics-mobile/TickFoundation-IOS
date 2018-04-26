//
//  UIDevice+DDExtension.h
//  Pods
//
//  Created by yangbo on 17/4/7.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DDNetworkType) {
    DDNetworkUnknown = 0,
    DDWifi = 1,
    DD5G = 2,
    DD4G = 3,
    DD3G = 4,
    DD2G = 5,
};

@interface UIDevice (DDExtension)

+ (DDNetworkType)dd_networkStatus;

+ (NSString *)dd_deviceString;

@end
