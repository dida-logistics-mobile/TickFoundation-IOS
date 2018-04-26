//
//  DDFilterView.m
//  Dida
//
//  Created by yangbo on 17/4/20.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDFilterView.h"
#import "DDFilterItemButton.h"
#import "UIColor+DDColor.h"
#import "UIColor+Extension.h"
#import "UIView+Extension.h"
#import "UIView+RSAdditions.h"
#import "DDPublicMacro.h"

#define DDFilterItemHeight 30
#define DDFilterItemMinWidth 85
#define DDFilterItemMaxWidth 97
#define DDFilterItemRowOffset 15 //行间距
#define DDFilterItemColOffert 15 //列间距

@implementation DDFilterItemModel

+ (instancetype)modelWithTitle:(NSString *)title value:(NSString *)value{
    DDFilterItemModel *model = [[DDFilterItemModel alloc] init];
    model.title = title;
    model.value = value;
    return model;
}

-(id)copyWithZone:(NSZone *)zone{
    DDFilterItemModel *model = [[[self class] allocWithZone:zone] init];
    model.selected = self.selected;
    model.title = self.title;
    model.value = self.value;
    return model;
}

@end

@implementation DDFilterModel

+ (instancetype)modelWithTitle:(NSString *)title filterId:(NSString *)filterId{
    DDFilterModel *model = [[DDFilterModel alloc] init];
    model.title = title;
    model.filterId = filterId;
    return model;
}

-(id)copyWithZone:(NSZone *)zone{
    DDFilterModel *model = [[[self class] allocWithZone:zone] init];
    model.title = self.title;
    model.cellHeight = self.cellHeight;
    model.filterId = self.filterId;
    model.items = [[NSArray alloc] initWithArray:self.items copyItems:YES];
    return model;
}

- (NSDictionary *)filterDic{
    if(self.filterId == nil)
        return nil;
    for(DDFilterItemModel *item in self.items){
        if(item.selected){
            if(item.value){
                return @{self.filterId:item.value};
            }else{
                return nil;
            }
        }
    }
    
    return nil;
}

+ (NSDictionary *)filtersDicWithArray:(NSArray<DDFilterModel *> *)filters{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [filters enumerateObjectsUsingBlock:^(DDFilterModel* _Nonnull filter, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *filterDic = [filter filterDic];
        if(filterDic){
            [dic addEntriesFromDictionary:filterDic];
        }
    }];
    return dic;
}

@end

@implementation DDFilterView

- (instancetype)initWithFilters:(NSArray *)filters{
    if(self = [super initWithContentViewWidth:241]){
        _filters = [[NSArray alloc] initWithArray:filters copyItems:YES];
        
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.width, 64)];
        topView.backgroundColor = [UIColor dd_themeColor];
        [self.contentView addSubview:topView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, self.contentView.width, 44)];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.text = @"筛选";
        [topView addSubview:titleLabel];
    
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, topView.height, self.contentView.width, self.height-64-44) style:UITableViewStylePlain];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.delegate = self;
        _table.dataSource = self;
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.width, 15)];
        _table.tableFooterView = footerView;
        [self.contentView addSubview:_table];
        
        UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [resetBtn setTitle:@"重置" forState:UIControlStateNormal];
        [resetBtn setTitleColor:[UIColor dd_themeColor] forState:UIControlStateNormal];
        resetBtn.backgroundColor = [UIColor whiteColor];
        resetBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        resetBtn.frame = CGRectMake(0, self.height-44, self.contentView.width/2, 44);
        [resetBtn addTarget:self action:@selector(resetBtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:resetBtn];
        
        UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [doneBtn setTitle:@"完成" forState:UIControlStateNormal];
        [doneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        doneBtn.backgroundColor = [UIColor dd_themeColor];
        doneBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        doneBtn.frame = CGRectMake(self.contentView.width/2, self.height-44, self.contentView.width/2, 44);
        [doneBtn addTarget:self action:@selector(doneBtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:doneBtn];

        //分割线
        UIView *separeLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-44, self.contentView.width, .5)];
        separeLine.backgroundColor = [UIColor dd_themeColor];
        [self.contentView addSubview:separeLine];
    }
    
    return self;
}

- (void)resetBtnPressed{
    [_filters enumerateObjectsUsingBlock:^(DDFilterModel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.items enumerateObjectsUsingBlock:^(DDFilterItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.selected = NO;
        }];
    }];
    
    [_table reloadData];
}

- (void)doneBtnPressed{
    if(_doneBtnPressedBlock){
        _doneBtnPressedBlock(_filters);
    }
    [self removeWithAnimated:YES];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _filters.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DDFilterModel *model = _filters[indexPath.row];
    if(model.cellHeight == 0){
        model.cellHeight = 18+15+18+((model.items.count-1)/2+1)*DDFilterItemHeight+((model.items.count-1)/2)*DDFilterItemRowOffset;
    }
    
    return model.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    DDFilterModel *model = _filters[indexPath.row];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 18, self.contentView.width, 16)];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor dd_inputTextColor];
    titleLabel.text = model.title;
    [cell.contentView addSubview:titleLabel];
    
    CGFloat leftOffset = 15;
    for(int i = 0; i < model.items.count; i++){
        DDFilterItemModel *item = model.items[i];
        DDFilterItemButton *btn = [DDFilterItemButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat row = i/2;
        CGFloat col = i%2;
        
        CGFloat width = [item.title boundingRectWithSize:CGSizeMake(1000, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.width;
        
        CGFloat itemWidth = MAX(width+DDFilterItemHeight, DDFilterItemMinWidth);
        itemWidth = MIN(itemWidth, DDFilterItemMaxWidth);
        
        btn.frame = CGRectMake(leftOffset, 18+15+18+row*(DDFilterItemHeight+DDFilterItemColOffert), itemWidth, DDFilterItemHeight);
        btn.model = item;
        [cell.contentView addSubview:btn];
        
        if(col == 1){
            leftOffset = 15;
        }else{
            leftOffset += itemWidth + DDFilterItemColOffert;
        }
        
        WS(weakSelf)
        [btn setDidTaped:^(DDFilterItemModel *model,BOOL selected) {
            [weakSelf updateSelectItem:model selected:selected index:indexPath.row];
        }];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)updateSelectItem:(DDFilterItemModel *)item selected:(BOOL)selected index:(NSInteger)index{
    if(index >= _filters.count){
        return;
    }
    
    DDFilterModel *model = _filters[index];
    for(DDFilterItemModel *filterItem in model.items){
        if(filterItem != item){
            filterItem.selected = NO;
        }
    }
    item.selected = selected;
    [_table reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

@end
