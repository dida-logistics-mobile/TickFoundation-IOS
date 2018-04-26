//
//  DDSegmentedControl.h
//  DidaShipper
//
//  Created by yangbo on 17/3/15.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DDSegmentedControlStyle) {
    DDSegmentedControlRoundStyle,
    DDSegmentedControlLineStyle,
    DDSegmentedControlSliderEqualTitleWidth,
};

@interface DDSegmentedControl : UIView

@property (nonatomic, readonly) NSInteger selectedIndex;
@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIColor *sliderColor;
@property (nonatomic, strong) UIColor *selectedTextColor;
@property (nonatomic, strong) UIColor *defaultTextColor;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic) DDSegmentedControlStyle style;
@property (nonatomic) CGFloat lineSliderHeight;


@property (nonatomic, copy) void (^selectedIndexBlock)(NSInteger index);
@property (nonatomic, copy) BOOL (^shouldSelectedIndexBlock)(NSInteger index);

- (instancetype)initWithTitles:(NSArray *)titles frame:(CGRect)frame;

- (instancetype)initWithTitles:(NSArray *)titles frame:(CGRect)frame style:(DDSegmentedControlStyle)style;

- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated;


@end
