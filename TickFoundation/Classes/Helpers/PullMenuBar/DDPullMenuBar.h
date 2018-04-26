//
//  PullMenuBar.h
//  DidaShipper
//
//  Created by yangbo on 17/3/16.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDPullMenuBar;
@protocol DDPullMenuBarDelegate <NSObject>

@required

///分区数
- (NSInteger)numberOfSegmentedWithPullMenuBar:(DDPullMenuBar *)bar;

///每个分区内容
- (NSArray *)titleListWithSegmentedIndex:(NSInteger)index;

///index分区选中行 -1都不选中
- (NSInteger)selectedRowAtSegmentedIndex:(NSInteger)index;

///分区标题
- (NSString *)titleAtSegmentedIndex:(NSInteger)index;

@optional
///点击某行
- (void)didSelectRow:(NSInteger)row atSegmentedIndex:(NSInteger)index;

@end

@interface DDPullMenuBar : UIView

@property (nonatomic, weak) id<DDPullMenuBarDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<DDPullMenuBarDelegate>)delegate;

@end
