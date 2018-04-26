//
//  DDFilterItemButton.h
//  Dida
//
//  Created by yangbo on 17/4/20.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDFilterItemModel;
@interface DDFilterItemButton : UIButton

@property (nonatomic, strong) DDFilterItemModel *model;
@property (nonatomic, copy) void (^didTaped)(DDFilterItemModel *model,BOOL selected);

@end
