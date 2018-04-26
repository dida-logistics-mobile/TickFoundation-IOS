//
//  UITableViewCell+Extension.h
//  DidaShipper
//
//  Created by yangbo on 17/1/19.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SeparateLine)

- (void)dd_addTopSeparateLine;

- (void)dd_addBottomSeparateLine;

- (void)dd_addTopSeparateLineWithLeftOffset:(CGFloat)offset;

- (void)dd_addBottomSeparateLineWithLeftOffset:(CGFloat)offset;

- (void)dd_removeSeparateLine;

@end
