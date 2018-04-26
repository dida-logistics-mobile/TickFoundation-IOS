//
//  UIControl+DDStastistics.m
//  DidaShipper
//
//  Created by yangbo on 17/4/5.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "UIControl+DDStastistics.h"
#import <objc/runtime.h>
#import "DDStatistics.h"
#import "DDStatsEventManager.h"

@implementation UIControl (DDStastistics)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(ddStastistics_sendAction:to:forEvent:);
        
        Method originalMethod = class_getInstanceMethod([self class], originalSelector);
        Method swizzledMethod = class_getInstanceMethod([self class], swizzledSelector);

        BOOL success = class_addMethod([self class], originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod([self class], swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }

    });
}

- (NSString *)dd_stastisticsId{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setDd_stastisticsId:(NSString *)dd_stastisticsId{
    objc_setAssociatedObject(self, @selector(dd_stastisticsId), dd_stastisticsId, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)dd_stastisticsLabel{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setDd_stastisticsLabel:(NSString *)dd_stastisticsLabel{
    objc_setAssociatedObject(self, @selector(dd_stastisticsLabel), dd_stastisticsLabel, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - Method Swizzling
- (void)ddStastistics_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
{
    //插入埋点代码
    [self dd_performStastisticsAction:action to:target forEvent:event];
    [self ddStastistics_sendAction:action to:target forEvent:event];
}

- (void)dd_performStastisticsAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
{
    if(self.dd_stastisticsId.length > 0){
        [DDStatistics logEvent:self.dd_stastisticsId eventLabel:nil];
    }
}


@end
