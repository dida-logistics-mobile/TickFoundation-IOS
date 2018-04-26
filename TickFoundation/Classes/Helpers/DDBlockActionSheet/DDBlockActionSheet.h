//
//  DDBlockActionSheet.h
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDBlockActionSheet;
typedef void (^HWActionSheetButtonHandler)(DDBlockActionSheet* sheet, NSInteger buttonIndex);

@interface DDBlockActionSheet : UIActionSheet <UIActionSheetDelegate>

@property (nonatomic, copy) HWActionSheetButtonHandler buttonHandler;

+ (void)dismissActionsheet;

+(void)showFromView:(UIView*)view
              title:(NSString*)title
	 cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
	 otherButtonTitles:(NSArray *)otherButtonTitles
         completion:(HWActionSheetButtonHandler)completionBlock;

@end
