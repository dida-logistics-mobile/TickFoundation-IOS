//
//  MultiClickFix.h
//  DidaShipper
//
//  Created by yangbo on 17/1/22.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

///按钮重复点击fix
@interface UIControl (MultiClickFix)

@property (nonatomic, assign) NSTimeInterval dd_acceptEventInterval; // 重复点击的间隔
@property (nonatomic, assign) NSTimeInterval dd_acceptEventTime;


@end
