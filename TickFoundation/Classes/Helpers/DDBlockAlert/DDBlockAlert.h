//
//  DDBlockAlert.h
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDBlockAlert : UIAlertView

/// 初始化一个 AlertView，只有一个按钮，点击取消
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;

/// 给 AlertView 添加按钮，按钮回调在 block 中设置
- (void)addButtonWithTitle:(NSString *)title handler:(dispatch_block_t)handler;

- (void)setCancelButtonHandler:(dispatch_block_t)handler;

+ (void)dismissAllAlertView;

@end
