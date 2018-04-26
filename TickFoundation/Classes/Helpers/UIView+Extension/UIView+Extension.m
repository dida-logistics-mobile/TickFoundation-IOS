//
//  UIView+Extension.m
//  Dida
//
//  Created by yangbo on 17/1/6.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)


- (void)dd_removeAllSubviews{
    NSArray *subviews = [self subviews];
    for(UIView *subview in subviews){
        [subview removeFromSuperview];
    }
}

- (void)dd_resignSubviewFirstResponder{
    NSArray *subviews = [self subviews];
    for(UIView *subview in subviews){
        if([subview isFirstResponder]){
            [subview resignFirstResponder];
            return;
        }else{
            [subview dd_resignSubviewFirstResponder];
        }
    }
}

@end
