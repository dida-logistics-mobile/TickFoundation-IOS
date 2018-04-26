//
//  UICodeHook.h
//  Pods
//
//  Created by yangbo on 16/12/15.
//
//

#import <Foundation/Foundation.h>

///UI操作保护，如果在异步线程之行UI操作，则断言
@interface UIView (DDUICodeHook)

@end

@interface CALayer (DDUICodeHook)

@end
