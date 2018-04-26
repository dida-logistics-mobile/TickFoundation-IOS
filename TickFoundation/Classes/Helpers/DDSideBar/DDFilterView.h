//
//  DDFilterView.h
//  Dida
//
//  Created by yangbo on 17/4/20.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDSideBar.h"

@interface DDFilterItemModel : NSObject <NSCopying>

@property (nonatomic) BOOL selected;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *value; //item值

+ (instancetype)modelWithTitle:(NSString *)title value:(NSString *)value;

@end

@interface DDFilterModel : NSObject <NSCopying>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *filterId; //服务器请求字段
@property (nonatomic, strong) NSArray<DDFilterItemModel *> *items;
@property (nonatomic) CGFloat cellHeight;

+ (instancetype)modelWithTitle:(NSString *)title filterId:(NSString *)filterId;

+ (NSDictionary *)filtersDicWithArray:(NSArray<DDFilterModel *> *)filters;
- (NSDictionary *)filterDic;

@end

///过滤视图
@interface DDFilterView : DDSideBar <UITableViewDelegate,UITableViewDataSource>
{
    NSArray         *_filters;
    UITableView     *_table;
}

@property (nonatomic, copy) void (^doneBtnPressedBlock)(NSArray *filters);

- (instancetype)initWithFilters:(NSArray *)filters;

@end
