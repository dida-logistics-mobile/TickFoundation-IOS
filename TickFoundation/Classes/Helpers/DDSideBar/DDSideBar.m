//
//  DDSideBar.m
//  Dida
//
//  Created by yangbo on 17/4/20.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDSideBar.h"
#import "UIColor+DDColor.h"
#import "UIColor+Extension.h"
#import "UIView+Extension.h"
#import "UIView+RSAdditions.h"
#import "DDPublicMacro.h"
#import <Masonry/Masonry.h>

@implementation DDSideBar

- (instancetype)initWithContentViewWidth:(CGFloat)width{
    if(self = [super init]){
        self.backgroundColor = [UIColor clearColor];
        self.frame = [UIScreen mainScreen].bounds;
        
        _bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bgBtn.frame = self.bounds;
        _bgBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
        [_bgBtn addTarget:self action:@selector(bgBtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bgBtn];
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, self.height)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        
        BOOL isShowTip = [[[NSUserDefaults standardUserDefaults] objectForKey:@"dd_isShowFilterTip"] boolValue];
        if(!isShowTip){
            NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"TickFoundation" ofType:@"bundle"]];
            UIImage *image = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"btn_click" ofType:@"png"]];
            
            UIView *tipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width-width, self.height)];
            tipView.userInteractionEnabled = NO;
            [self addSubview:tipView];
            
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            [tipView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(tipView.mas_centerY).with.offset(10);
                make.centerX.equalTo(tipView.mas_centerX);
                make.size.mas_equalTo(CGSizeMake(25, 29));
            }];
            
            UILabel *tipLabel = [[UILabel alloc] init];
            tipLabel.textColor = [UIColor whiteColor];
            tipLabel.numberOfLines = 2;
            tipLabel.font = [UIFont systemFontOfSize:15];
            tipLabel.text = @"轻触这里\n关闭筛选";
            [tipView addSubview:tipLabel];
            [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(tipView.mas_centerY).with.offset(-10);
                make.centerX.equalTo(tipView.mas_centerX);
            }];
            
            [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"dd_isShowFilterTip"];
        }
    }
    
    return self;
}

- (void)bgBtnPressed{
    [self removeWithAnimated:YES];
}

- (void)showFromView:(UIView *)fromView animated:(BOOL)animated{
    [fromView addSubview:self];
    _contentView.left = self.width;
    _bgBtn.alpha = 0;
    if(animated){
        [UIView animateWithDuration:.25 animations:^{
            _contentView.right = self.width;
            _bgBtn.alpha = 1;
        }];
    }else{
        _contentView.right = self.width;
    }
}

- (void)removeWithAnimated:(BOOL)animated{
    if(animated){
        [UIView animateWithDuration:.25 animations:^{
            _contentView.left = self.width;
            _bgBtn.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else{
        _contentView.left = self.width;
        _bgBtn.alpha = 0;
        [self removeFromSuperview];
    }
}

@end
