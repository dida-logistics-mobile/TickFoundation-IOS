//
//  DDPullMenuBaseView.h
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDPullMenuBaseView : UIView
{
    UIView *_containerView;
    UIView *_contentView;
    UIButton *_bgBtn;
    CGSize _contentSize;
    CGRect _pointViewConvertRect;
    UIView *_bgView;
}

@property (nonatomic) BOOL isTapBackgroundRemoved; //默认YES 
@property (nonatomic) CGFloat pointViewOffsetY; //默认0 距离pointView垂直距离
@property (nonatomic) BOOL isFullScreenWidthLayout; //是否全屏宽度展示menu
@property (nonatomic) BOOL isShowBlackBg; //显示半透明灰色背景 默认YES
@property (nonatomic,copy) void (^menuCancleAction)(void);

-(instancetype)initWithContentView:(UIView *)contentView pointView:(UIView *)view size:(CGSize)size;

- (void)show;

- (void)removeWithAnimated:(BOOL)animated;

@end
