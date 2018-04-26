//
//  DDMenuView.m
//  YCXMenuDemo_ObjC
//
//  Created by 李龙飞 on 17/3/14.
//  Copyright © 2017年 NiuMeng. All rights reserved.
//

#import "DDMenuView.h"
#import "YCXMenu.h"

@implementation DDMenuView



+(void)showMenuViewWithImages:(NSArray *)images titles:(NSArray *)titles targetView:(UIView *)targetView fromRect:(CGRect)rect menuIndex:(selIndexBlock)indexBlock
{
    if (images.count==0) {
        return;
    }
    if (images.count!=titles.count) {
        return;
    }
    
    NSMutableArray *items=[NSMutableArray array];
    for (NSInteger i=0; i<images.count; i++) {
       YCXMenuItem *item=[YCXMenuItem menuItem:titles[i]
                        image:images[i]
                          tag:100+i
                     userInfo:@{@"title":@"Menu"}];
        item.foreColor = [UIColor blackColor];
        item.titleFont = [UIFont systemFontOfSize:15];

        [items addObject:item];
    }
    
    [YCXMenu setHasShadow:NO];
    [YCXMenu setSeparatorColor:[UIColor lightGrayColor]];
    [YCXMenu setTintColor:[UIColor whiteColor]];
    [YCXMenu setSelectedColor:[UIColor lightGrayColor]];
    [YCXMenu showMenuInView:targetView fromRect:rect menuItems:items selected:^(NSInteger index, YCXMenuItem *item) {
        indexBlock(index);
    }];
    

    
   

}


@end
