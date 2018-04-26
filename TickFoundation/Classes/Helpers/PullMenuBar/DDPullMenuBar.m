//
//  PullMenuBar.m
//  DidaShipper
//
//  Created by yangbo on 17/3/16.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDPullMenuBar.h"
#import "DDPullMenuView.h"
#import "UIView+RSAdditions.h"
#import "UIColor+Extension.h"

@implementation DDPullMenuBar
{
    NSMutableArray *_itemButtons;
}

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<DDPullMenuBarDelegate>)delegate{
    if(self = [super initWithFrame:frame]){
        _delegate = delegate;
        _itemButtons = [[NSMutableArray alloc] init];
        
        [self loadViews];
    }
    
    return self;
}

- (void)loadViews{
    [_itemButtons enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    [_itemButtons removeAllObjects];
    
    NSInteger segmentedCount = [_delegate numberOfSegmentedWithPullMenuBar:self];
    if(segmentedCount == 0)
        return;
    
    CGFloat width = self.width/segmentedCount;
    for(int i = 0; i < segmentedCount; i++){
        UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        menuBtn.frame = CGRectMake(width*i, 0, width, self.height);
        [menuBtn setImage:[UIImage imageNamed:@"icon_shangjiantou"] forState:UIControlStateNormal];
        [menuBtn setImage:[UIImage imageNamed:@"icon_xiajiantou"] forState:UIControlStateSelected];
        [menuBtn setTitle:[_delegate titleAtSegmentedIndex:i] forState:UIControlStateNormal];
        [menuBtn setTitleColor:[UIColor dd_colorWithHexString:@"656d78"] forState:UIControlStateNormal];
        menuBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        menuBtn.tag = i;
        [menuBtn addTarget:self action:@selector(itemPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self layoutMenuBtnSubviews:menuBtn];

        [self addSubview:menuBtn];
        [_itemButtons addObject:menuBtn];
        
        if(i != segmentedCount -1){
            UIView *separeline = [[UIView alloc] init];
            separeline.backgroundColor = [UIColor dd_colorWithHexString:@"dbd9d9"];
            separeline.frame = CGRectMake(width-1, 0, 0.5, menuBtn.height);
            [menuBtn addSubview:separeline];
        }
    }
}


- (void)layoutMenuBtnSubviews:(UIButton *)menuBtn{
    UIImage *normalImage = [UIImage imageNamed:@"icon_shangjiantou"];
    CGSize titleSize = [[menuBtn titleForState:UIControlStateNormal] boundingRectWithSize:CGSizeMake(1000, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:menuBtn.titleLabel.font} context:nil].size;
    [menuBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -normalImage.size.width-5, 0, normalImage.size.width+5)];
    [menuBtn setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width+5, 0, -titleSize.width-5)];
}

- (void)itemPressed:(UIButton *)sender{
    NSArray *list = [_delegate titleListWithSegmentedIndex:sender.tag];
    
    if(list.count == 0)
        return;
    
    sender.selected = YES;
    
    DDPullMenuView *menuView = [DDPullMenuView pullMenuWithTitles:list fromView:sender selectedIndex:[_delegate selectedRowAtSegmentedIndex:sender.tag]];
    [menuView show];
    [menuView setSelecetCellAtIndex:^(NSInteger row) {
        sender.selected = NO;
        if([_delegate respondsToSelector:@selector(didSelectRow:atSegmentedIndex:)]){
            [_delegate didSelectRow:row atSegmentedIndex:sender.tag];
        }
        
        [sender setTitle:[_delegate titleAtSegmentedIndex:sender.tag] forState:UIControlStateNormal];
        [self layoutMenuBtnSubviews:sender];
    }];
    
    [menuView setMenuCancleAction:^{
        sender.selected = NO;
    }];
}


@end
