//
//  DDBlockActionSheet.m
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import "DDBlockActionSheet.h"

static DDBlockActionSheet *sheet = nil;

@implementation DDBlockActionSheet

+ (void)dismissActionsheet {
    sheet.delegate = nil;
    [sheet dismissWithClickedButtonIndex:0 animated:YES];
    sheet = nil;
}

+(void)showFromView:(UIView*)view
              title:(NSString*)title
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
         completion:(HWActionSheetButtonHandler)completionBlock {
    sheet = [[self alloc] initWithTitle:title
                      cancelButtonTitle:cancelButtonTitle
                 destructiveButtonTitle:destructiveButtonTitle
                      otherButtonTitles:otherButtonTitles
                             completion:completionBlock];
    [sheet showFromView:view];
}

- (id)initWithTitle:(NSString*)title
  cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
         completion:(HWActionSheetButtonHandler)completionBlock;
{
    NSString* firstOther = (otherButtonTitles && ([otherButtonTitles count]>0)) ? [otherButtonTitles objectAtIndex:0] : nil;
    self = [super initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:firstOther,nil];
    if (self != nil) {
        for(NSInteger idx = 1; idx<[otherButtonTitles count];++idx) {
            [self addButtonWithTitle: [otherButtonTitles objectAtIndex:idx] ];
        }
        if (cancelButtonTitle) {
            [self addButtonWithTitle:cancelButtonTitle];
            self.cancelButtonIndex = self.numberOfButtons - 1;
        }
        
        self.buttonHandler = completionBlock;
    }
    return self;
}

-(void)showFromView:(UIView *)view {
    if ([view isKindOfClass:[UITabBar class]]) {
        [self showFromTabBar:(UITabBar*)view];
    } else if ([view isKindOfClass:[UIToolbar class]]) {
        [self showFromToolbar:(UIToolbar*)view];
    } else if ([view isKindOfClass:[UIBarButtonItem class]]) {
        [self showFromBarButtonItem:(UIBarButtonItem *)view animated:YES];
    } else {
        [super showFromRect:view.frame inView:view animated:YES];
    }
}

#pragma mark - UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.buttonHandler) {
        self.buttonHandler(self,buttonIndex);
        self.buttonHandler = nil;
        sheet = nil;
    }
}

@end
