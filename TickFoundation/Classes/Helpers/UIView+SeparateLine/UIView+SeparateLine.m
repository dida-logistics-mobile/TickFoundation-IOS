//
//  UITableViewCell+Extension.m
//  DidaShipper
//
//  Created by yangbo on 17/1/19.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "UIView+SeparateLine.h"
#import <Masonry/Masonry.h>
#import "UIColor+Extension.h"
#import "UIColor+DDColor.h"

#define TopSeparateLineTag 10983
#define BottomSeparateLineTag 10982

@implementation UIView (SeparateLine)

- (void)dd_addTopSeparateLine{
    [[self viewWithTag:TopSeparateLineTag] removeFromSuperview];
    
    UIView *separeline = [[UIView alloc] init];
    separeline.tag = TopSeparateLineTag;
    separeline.backgroundColor = [UIColor dd_separateColor];
    [self addSubview:separeline];
    [separeline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.height.mas_equalTo(.5);
    }];
}

- (void)dd_addBottomSeparateLine{
    [[self viewWithTag:BottomSeparateLineTag] removeFromSuperview];

    UIView *separeline = [[UIView alloc] init];
    separeline.tag = BottomSeparateLineTag;
    separeline.backgroundColor = [UIColor dd_separateColor];
    [self addSubview:separeline];
    [separeline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.mas_equalTo(.5);
    }];
}

- (void)dd_addTopSeparateLineWithLeftOffset:(CGFloat)offset{
    [[self viewWithTag:TopSeparateLineTag] removeFromSuperview];

    UIView *separeline = [[UIView alloc] init];
    separeline.tag = TopSeparateLineTag;
    separeline.backgroundColor = [UIColor dd_separateColor];
    [self addSubview:separeline];
    [separeline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(offset);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.mas_top);
        make.height.mas_equalTo(.5);
    }];
}

- (void)dd_addBottomSeparateLineWithLeftOffset:(CGFloat)offset{
    [[self viewWithTag:BottomSeparateLineTag] removeFromSuperview];

    UIView *separeline = [[UIView alloc] init];
    separeline.tag = BottomSeparateLineTag;
    separeline.backgroundColor = [UIColor dd_separateColor];
    [self addSubview:separeline];
    [separeline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(offset);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.mas_equalTo(.5);
    }];
}

- (void)dd_removeSeparateLine{
    [[self viewWithTag:TopSeparateLineTag] removeFromSuperview];
    [[self viewWithTag:BottomSeparateLineTag] removeFromSuperview];
}

@end
