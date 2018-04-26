//
//  PublicMacro.h
//  VCloudChat
//
//  Created by palmwin on 16/9/19.
//  Copyright © 2016年 Handwin. All rights reserved.
//

#ifndef DDPublicMacro_h
#define DDPublicMacro_h

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER \
\
+ (instancetype)sharedInstance;

#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)sharedInstance { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
@synchronized(self){ \
shared##className = [[self alloc] init]; \
} \
}); \
return shared##className; \
}

#define IOS10_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending)
#define IOS9_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending)
#define IOS8_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending)
#define IOS7_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending)

#define kScreenHeight               [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth                ([[UIScreen mainScreen] applicationFrame].size.width)

#define IsEmptyString(str) (([str isKindOfClass:[NSString class]] && str.length == 0) || ([str isKindOfClass:[NSNull class]]) || str == nil)

#define NavHeight 44
#define StatusBarHeiht 20
#define TabbarHeight 49

#define NullToNil(a) ([(a) isKindOfClass:[NSNull class]] ? nil : (a))
#define NilToEmptyString(str) ((str) ? (str) : @"")
#define IntToString(i) [NSString stringWithFormat:@"%ld",(long)(i)]


#define LocalizedString(str) NSLocalizedString(str, nil)

#endif /* DDPublicMacro_h */
