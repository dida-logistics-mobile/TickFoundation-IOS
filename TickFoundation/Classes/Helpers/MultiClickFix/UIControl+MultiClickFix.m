//
//  MultiClickFix.m
//  DidaShipper
//
//  Created by yangbo on 17/1/22.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "UIControl+MultiClickFix.h"
#import <objc/runtime.h>
#import "LoggerManager.h"

@implementation UIControl (MultiClickFix)

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

- (NSTimeInterval)dd_acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setDd_acceptEventInterval:(NSTimeInterval)dd_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(dd_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";

- (NSTimeInterval)dd_acceptEventTime {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setDd_acceptEventTime:(NSTimeInterval)dd_acceptEventTime {
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(dd_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


// 在load时执行hook
+ (void)load {
    Method before   = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method after    = class_getInstanceMethod(self, @selector(dd_sendAction:to:forEvent:));
    method_exchangeImplementations(before, after);
}

- (void)dd_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.dd_acceptEventTime < self.dd_acceptEventInterval) {
        DDLogWarn(@"按钮点击|重复点击");
        return;
    }
    
    if (self.dd_acceptEventInterval > 0) {
        self.dd_acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    
    [self dd_sendAction:action to:target forEvent:event];
}


@end
