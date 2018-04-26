//
//  UICodeHook.m
//  Pods
//
//  Created by yangbo on 16/12/15.
//
//

#import "UICodeHook.h"
#import <objc/runtime.h>

@implementation UIView (DDUICodeHook)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIView hookMethod:@selector(setNeedsLayout) swizzledSelector:@selector(dd_setNeedsLayout)];
        [UIView hookMethod:@selector(setNeedsDisplay) swizzledSelector:@selector(dd_setNeedsDisplay)];
    });
}

- (void)dd_setNeedsLayout
{
    [self dd_setNeedsLayout];
    
    NSAssert([NSThread isMainThread], @"UI update is not at main thread");
}

- (void)dd_setNeedsDisplay
{
    [self dd_setNeedsDisplay];
    
    NSAssert([NSThread isMainThread], @"UI update is not at main thread");
}


+ (void)hookMethod:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (success) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end

@implementation CALayer (DDUICodeHook)

@end
