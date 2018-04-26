//
//  WKTipView.m
//  DidaShipper
//
//  Created by yangbo on 17/3/6.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDTipView.h"
#import <Masonry/Masonry.h>

static UIWindow *tipWindow = nil;

@implementation DDTipView

///contentView 内容视图
- (instancetype)initWithContentView:(UIView *)contentView{
    if(self = [super initWithFrame:[UIScreen mainScreen].bounds]){
        self.backgroundColor=[UIColor colorWithWhite:0 alpha:.6];
        
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [bgBtn addTarget:self action:@selector(bgBtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bgBtn];
        [bgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(contentView.frame.size);
        }];
    }
    
    return self;
}

- (void)bgBtnPressed{
    if(_isTapBackgroundRemoved){
        [self removeAfterDelay:0 animated:YES];
    }
}

///弹框消失 delay为0时立即消失
- (void)removeAfterDelay:(CGFloat)delay animated:(BOOL)animated{
    if(delay == 0){
        [self removeFromSuperview];
        tipWindow.hidden = YES;
        tipWindow = nil;
    }else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self removeFromSuperview];
            tipWindow.hidden = YES;
            tipWindow = nil;
        });
    }
}

///弹框显示
- (void)showWithAnimated:(BOOL)animated{
    UIWindow *formerKeyWindow = [[UIApplication sharedApplication] keyWindow];
    
    if(tipWindow == nil){
        tipWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        tipWindow.windowLevel = UIWindowLevelStatusBar;
    }
    
    [tipWindow makeKeyAndVisible];
    [formerKeyWindow makeKeyWindow];
    [tipWindow addSubview:self];
}

@end
