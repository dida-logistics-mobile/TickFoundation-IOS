//
//  DDTouchImageView.h
//  DidaShipper
//
//  Created by yangbo on 17/3/6.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDTouchImageView : UIImageView

@property (nonatomic, copy) void (^tapBlock)(void);

@end
