//
//  DDToastTipView.h
//  DidaShipper
//
//  Created by yangbo on 17/3/15.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/DDTipView.h>

@interface DDToastTipView : DDTipView

+ (DDToastTipView *)showToastTipWithContent:(NSString *)content
                                   duration:(NSTimeInterval)duration
                     isTapBackgroundRemoved:(BOOL)isTapBackgroundRemoved;

+ (DDToastTipView *)toastTipViewWithContent:(NSString *)content;

@end
