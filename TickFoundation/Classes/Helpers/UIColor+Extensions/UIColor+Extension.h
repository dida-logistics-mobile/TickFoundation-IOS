//
//  UIColor.h
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (Extension)

+ (UIColor *)dd_colorWithIntegerRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b;
+ (UIColor *)dd_colorWithHexString:(NSString *)string;
+ (UIColor *)dd_colorWithHexString:(NSString *)string alpha:(float) alpha;

@end
