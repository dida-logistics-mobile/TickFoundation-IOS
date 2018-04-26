//
//  HudTool.m
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import "DDHudTool.h"

@implementation DDHudTool

+ (MBProgressHUD *)showLoadingWithWithText:(NSString *)title view:(UIView *)view
{
    if(view == nil)
    {
        if([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]){
            view = [[UIApplication sharedApplication].delegate window];
        }else {
            view = [UIApplication sharedApplication].keyWindow;;
        }
    }
    
    return [self showLoadingWithWithText:title bezelViewColor:[UIColor blackColor] indicatorColor:[UIColor whiteColor] view:view animated:YES];
}

+ (MBProgressHUD *)showLoadingWithWithText:(NSString *)title bezelViewColor:(UIColor *)bezelViewColor indicatorColor:(UIColor *)indicatorColor view:(UIView *)view animated:(BOOL)animated
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    hud.labelColor = indicatorColor;
    hud.labelText = title;
    hud.color = bezelViewColor;
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = indicatorColor;
    
    [view addSubview:hud];
    [hud show:animated];
    
    return hud;
}

+ (void)removeLoadingViewInView:(UIView *)view
{
    if(view == nil)
    {
        if([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]){
            view = [[UIApplication sharedApplication].delegate window];
        }else {
            view = [UIApplication sharedApplication].keyWindow;
        }
    }
    
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (void)showToastWithTitle:(NSString *)title
{
    [self showToastWithTitle:title offset:0];
}

+ (void)showToastWithTitle:(NSString *)title offset:(CGFloat)offset;
{
    UIWindow *window = nil;
    if([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]){
        window = [[UIApplication sharedApplication].delegate window];
    }else {
        window = [UIApplication sharedApplication].keyWindow;
    }
    
    [MBProgressHUD hideHUDForView:window animated:NO];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:window];
    hud.mode = MBProgressHUDModeText;
    hud.color = [UIColor darkGrayColor];
    hud.detailsLabelColor = [UIColor whiteColor];
    hud.detailsLabelFont = [UIFont systemFontOfSize:13];
    hud.detailsLabelText = title;
    hud.cornerRadius = 5;
    hud.margin = 15;
    [window addSubview:hud];
    hud.yOffset = offset;
    hud.removeFromSuperViewOnHide = YES;
    hud.animationType = MBProgressHUDAnimationFade;
    hud.userInteractionEnabled = NO;
    [hud show:YES];
    [hud hide:YES afterDelay:2];
}

@end
