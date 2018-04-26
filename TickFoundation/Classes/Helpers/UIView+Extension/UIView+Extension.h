//
//  UIView+Extension.h
//  Dida
//
//  Created by yangbo on 17/1/6.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

///移除所有子视图
- (void)dd_removeAllSubviews;

//resign first responder
- (void)dd_resignSubviewFirstResponder;

@end
