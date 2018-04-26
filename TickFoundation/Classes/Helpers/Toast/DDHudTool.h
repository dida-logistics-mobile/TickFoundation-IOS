//
//  HudTool.h
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface DDHudTool : NSObject

//显示加载中界面,view为nil时添加到window上
+ (MBProgressHUD *)showLoadingWithWithText:(NSString *)title view:(UIView *)view;

+ (MBProgressHUD *)showLoadingWithWithText:(NSString *)title bezelViewColor:(UIColor *)bezelViewColor indicatorColor:(UIColor *)indicatorColor view:(UIView *)view animated:(BOOL)animated;

//移除view上的加载中界面
+ (void)removeLoadingViewInView:(UIView *)view;

//漂浮框
+ (void)showToastWithTitle:(NSString *)title;

//漂浮框 offset为偏移屏幕中心的位置
+ (void)showToastWithTitle:(NSString *)title offset:(CGFloat)offset;

@end
