//
//  DDPullMenuView.m
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDPullMenuView.h"
#import "DDPublicMacro.h"
#import "UIView+RSAdditions.h"
#import <Masonry/Masonry.h>
#import "UIColor+Extension.h"

static CGFloat cellHeight = 40;

@implementation DDPullMenuView

+(DDPullMenuView *)pullMenuWithTitles:(NSArray *)titles fromView:(UIView *)view selectedIndex:(NSInteger)index{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, titles.count*cellHeight)];
    DDPullMenuView *menuView = [[DDPullMenuView alloc] initWithContentView:contentView pointView:view size:CGSizeMake(view.width, contentView.height)];
    [menuView setSelectedRow:index];
    [menuView updateTableWithTitles:titles];
    return menuView;
}

-(void)setSelectedRow:(NSInteger)index{
    _selectedIndex=index;
}

- (void)updateTableWithTitles:(NSArray *)titles{
    if(_table == nil){
        _table = [[UITableView alloc] initWithFrame:_contentView.bounds style:UITableViewStylePlain];
        _table.delegate = self;
        _table.dataSource = self;
        _table.showsVerticalScrollIndicator = NO;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_contentView addSubview:_table];
        [_table mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_contentView);
        }];
    }
    
    _titlesArray = titles;
    [_table reloadData];
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = _titlesArray[indexPath.row];
    if(indexPath.row==_selectedIndex){
        label.textColor = [UIColor dd_colorWithHexString:@"00aff0"];
    }else{
        label.textColor = [UIColor dd_colorWithHexString:@"656d78"];
    }
    label.textAlignment=NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    
    [cell.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell);
    }];
    
    if(indexPath.row != _titlesArray.count-1){
        UIView *separeline = [[UIView alloc] initWithFrame:CGRectMake(0, cellHeight-1, tableView.width, .5)];
        separeline.backgroundColor = [UIColor dd_colorWithHexString:@"dbd9d9"];
        [cell.contentView addSubview:separeline];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_table deselectRowAtIndexPath:indexPath animated:YES];
    
    if(_selecetCellAtIndex){
        _selecetCellAtIndex(indexPath.row);
    }
    
    [self removeWithAnimated:YES];
}

@end
