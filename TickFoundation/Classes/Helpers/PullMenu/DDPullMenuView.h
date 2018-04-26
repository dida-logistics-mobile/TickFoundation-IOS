//
//  DDPullMenuView.h
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDPullMenuBaseView.h"

@interface DDPullMenuView : DDPullMenuBaseView <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_table;
    
    NSArray *_titlesArray;
    
    NSInteger _selectedIndex;
}

@property (nonatomic, copy) void (^selecetCellAtIndex)(NSInteger index);

+ (DDPullMenuView *)pullMenuWithTitles:(NSArray *)titles fromView:(UIView *)view selectedIndex:(NSInteger)index;

@end
