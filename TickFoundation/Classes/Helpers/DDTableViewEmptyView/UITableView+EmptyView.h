//
//  UITableView+EmptyView.h
//  空白页
//
//  Created by 李龙飞 on 17/4/7.
//  Copyright © 2017年 李龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDEmptyView.h"

@interface UITableView (EmptyView)

@property (nonatomic,strong) DDEmptyView *dd_emptyView;

-(void)dd_showEmptyViewWithOffset:(CGFloat)offsetY image:(NSString *)image content:(NSString *)content;
-(void)dd_showEmptyViewWithImage:(NSString *)image content:(NSString *)content;
-(void)dd_hiddenEmptyView;

@end
