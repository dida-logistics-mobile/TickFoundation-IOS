//
//  DDTouchImageView.m
//  DidaShipper
//
//  Created by yangbo on 17/3/6.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDTouchImageView.h"

@implementation DDTouchImageView
{
    UITapGestureRecognizer *_tapGestireRecognizer;
}

- (void)setTapBlock:(void (^)(void))tapBlock{
    _tapBlock = tapBlock;
    
    self.userInteractionEnabled = YES;
    if(_tapGestireRecognizer == nil){
        _tapGestireRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taped:)];
        [self addGestureRecognizer:_tapGestireRecognizer];
    }
}

- (void)taped:(id)sender{
    if(_tapBlock){
        _tapBlock();
    }
}

@end
