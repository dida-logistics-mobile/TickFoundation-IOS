//
//  WKTipView.h
//  DidaShipper
//
//  Created by yangbo on 17/3/6.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

///全屏弹框类
@interface DDTipView : UIView

@property (nonatomic) BOOL isTapBackgroundRemoved; //点击背景是否移除 默认NO

///contentView 内容视图
- (instancetype)initWithContentView:(UIView *)contentView;

///弹框消失 delay为0时立即消失
- (void)removeAfterDelay:(CGFloat)delay animated:(BOOL)animated;

///弹框显示
- (void)showWithAnimated:(BOOL)animated;

@end
