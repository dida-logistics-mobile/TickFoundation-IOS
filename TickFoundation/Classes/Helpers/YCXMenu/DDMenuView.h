//
//  DDMenuView.h
//  YCXMenuDemo_ObjC
//
//  Created by 李龙飞 on 17/3/14.
//  Copyright © 2017年 NiuMeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



typedef void (^selIndexBlock)(NSInteger index);

@interface DDMenuView : NSObject

+(void)showMenuViewWithImages:(NSArray *)images titles:(NSArray *)titles targetView:(UIView *)targetView fromRect:(CGRect)rect menuIndex:(selIndexBlock)indexBlock;

@end
