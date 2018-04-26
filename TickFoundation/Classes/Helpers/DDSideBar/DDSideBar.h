//
//  DDSideBar.h
//  Dida
//
//  Created by yangbo on 17/4/20.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

///侧滑视图(只支持全屏)
@interface DDSideBar : UIView

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIButton *bgBtn;

- (instancetype)initWithContentViewWidth:(CGFloat)width;

- (void)showFromView:(UIView *)fromView animated:(BOOL)animated;

- (void)removeWithAnimated:(BOOL)animated;

@end
