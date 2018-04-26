//
//  DDPullMenuBaseView.m
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDPullMenuBaseView.h"
#import <Masonry/Masonry.h>
#import "UIView+RSAdditions.h"
#import "UIColor+Extension.h"
#import "DDPublicMacro.h"

@implementation DDPullMenuBaseView

-(instancetype)initWithContentView:(UIView *)contentView pointView:(UIView *)view size:(CGSize)size{
    if(self = [super initWithFrame:[UIScreen mainScreen].bounds]){
        _contentView = contentView;
        _contentSize = size;
        _isShowBlackBg = YES;
        _isTapBackgroundRemoved = YES;
        self.clipsToBounds = YES;
        
        _bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bgBtn addTarget:self action:@selector(bgBtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bgBtn];
        [_bgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor clearColor];
        _containerView.clipsToBounds = YES;
        
        [self addSubview:_containerView];
        _pointViewConvertRect = [view.superview convertRect:view.frame toView:view.window];
        _containerView.frame = CGRectMake(_pointViewConvertRect.origin.x, CGRectGetMaxY(_pointViewConvertRect), _contentSize.width, _contentSize.height);
        
        [_containerView addSubview:_contentView];
        _contentView.frame = CGRectMake(0, -_containerView.height, _containerView.width, _containerView.height);
        
        self.isShowBlackBg = _isShowBlackBg;
    }
    
    return self;
}

- (void)bgBtnPressed{
    if(_isTapBackgroundRemoved){
        [self removeWithAnimated:YES];
        if (_menuCancleAction) {
            _menuCancleAction();
        }
    }
}

- (void)setPointViewOffsetY:(CGFloat)pointViewOffsetY{
    _pointViewOffsetY = pointViewOffsetY;
    
    if(_isFullScreenWidthLayout){
        _containerView.frame = CGRectMake(0, CGRectGetMaxY(_pointViewConvertRect)+_pointViewOffsetY, kScreenWidth, _contentSize.height);
    }else{
        _containerView.frame = CGRectMake(_pointViewConvertRect.origin.x, CGRectGetMaxY(_pointViewConvertRect)+_pointViewOffsetY, _contentSize.width, _contentSize.height);
    }
    
    self.isShowBlackBg = _isShowBlackBg;
}

- (void)setIsFullScreenWidthLayout:(BOOL)isFullScreenWidthLayout{
    _isFullScreenWidthLayout = isFullScreenWidthLayout;
    _containerView.frame = CGRectMake(0, CGRectGetMaxY(_pointViewConvertRect)+_pointViewOffsetY, kScreenWidth, _contentSize.height);
    _contentView.frame = CGRectMake(0, -_contentSize.height, kScreenWidth, _contentSize.height);
    
    self.isShowBlackBg = _isShowBlackBg;
}

-(void)setIsShowBlackBg:(BOOL)isShowBlackBg{
    _isShowBlackBg = isShowBlackBg;
    if(_isShowBlackBg){
        if(_bgView == nil){
            _bgView = [[UIView alloc] init];
            _bgView.backgroundColor= [UIColor blackColor];
            [self insertSubview:_bgView atIndex:0];
        }
        _bgView.frame = CGRectMake(0, CGRectGetMaxY(_pointViewConvertRect)+_pointViewOffsetY, kScreenWidth, self.height-CGRectGetMaxY(_pointViewConvertRect));
    }else{
        [_bgView removeFromSuperview];
        _bgView = nil;
    }
}


- (void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    _bgView.alpha = 0;
    [UIView animateWithDuration:.3 animations:^{
        _contentView.top = 0;
        _bgView.alpha = .6;
    }];
}

- (void)removeWithAnimated:(BOOL)animated{
    [UIView animateWithDuration:.3 animations:^{
        _contentView.top = -_contentSize.height;
        _bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
