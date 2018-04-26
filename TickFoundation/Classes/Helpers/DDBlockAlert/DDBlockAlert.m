//
//  DDBlockAlert.m
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import "DDBlockAlert.h"

static NSMutableArray * alertViewArray = nil;

@interface DDBlockAlert() <UIAlertViewDelegate>
@property (nonatomic,strong) NSMutableArray *handlers;
@end


@implementation DDBlockAlert

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle {
    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (self) {
        self.delegate = self;
        
        _handlers = [NSMutableArray array];
        if (cancelButtonTitle != nil) {
            [_handlers addObject:^{}];
        }
    }
    return self;
}

-(void)show
{
    [super show];
    if (alertViewArray == nil) {
        alertViewArray = [NSMutableArray array];
    }
    [alertViewArray addObject:self];
}

#pragma mark - UIAlertViewDelegate

- (void)addButtonWithTitle:(NSString *)title handler:(dispatch_block_t)handler {
    if (title == nil) {
        return;
    }
    
    [self addButtonWithTitle:title];
    
    if (handler == nil) {
        [self.handlers addObject:^{}];
    }else{
        [self.handlers addObject:handler];
    }
    
}

- (void)setCancelButtonHandler:(dispatch_block_t)handler
{
    if (handler) {
        [self.handlers removeObjectAtIndex:0];
        [self.handlers insertObject:handler atIndex:0];
    }
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(self.handlers){
        dispatch_block_t handler = self.handlers[buttonIndex];
        if(handler){
            handler();
        }
    }
    [alertViewArray removeObject:self];
}

+ (void)dismissAllAlertView
{
    [alertViewArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        DDBlockAlert * view = obj;
        [view dismissWithClickedButtonIndex:0 animated:NO];
    }];
}

@end
