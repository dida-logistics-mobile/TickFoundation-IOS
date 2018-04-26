//
//  UITableView+EmptyView.m
//  空白页
//
//  Created by 李龙飞 on 17/4/7.
//  Copyright © 2017年 李龙飞. All rights reserved.
//

#import "UITableView+EmptyView.h"
#import <objc/runtime.h>

static char *emptyViewKey = "emptyViewKey";


@implementation UITableView (EmptyView)

-(void)dd_showEmptyViewWithOffset:(CGFloat)offsetY image:(NSString *)image content:(NSString *)content{
    if (!self.dd_emptyView) {
        self.dd_emptyView = [[DDEmptyView alloc] initWithEmptyImage:image emptyTitle:content];
        
        [self addSubview:self.dd_emptyView];
    }
   
    self.dd_emptyView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2+offsetY);
}

-(void)dd_showEmptyViewWithImage:(NSString *)image content:(NSString *)content{
    if (!self.dd_emptyView) {
        self.dd_emptyView = [[DDEmptyView alloc] initWithEmptyImage:image emptyTitle:content];
        
        [self addSubview:self.dd_emptyView];
    }
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    CGRect rect = [self.superview convertRect:self.frame toView:window];
    CGFloat y = [UIScreen mainScreen].bounds.size.height/2-rect.origin.y;
    
    self.dd_emptyView.center = CGPointMake(self.frame.size.width/2, y);
}

-(void)dd_hiddenEmptyView{
    [self.dd_emptyView removeFromSuperview];
    self.dd_emptyView = nil;
}


-(void)setDd_emptyView:(DDEmptyView *)dd_emptyView{
     objc_setAssociatedObject(self, &emptyViewKey, dd_emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(DDEmptyView *)dd_emptyView{
    return objc_getAssociatedObject(self, &emptyViewKey);
}

@end
