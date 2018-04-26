//
//  DDDrawHelper.h
//  Dida
//
//  Created by yangbo on 16/12/30.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDDrawHelper : NSObject

+ (void)drawText:(NSString *)text
         context:(CGContextRef)context
        position:(CGPoint)p
            font:(UIFont *)font
           color:(UIColor *)color
      limitWidth:(CGFloat)width
          height:(CGFloat)height;

+ (void)drawImage:(UIImage *)image
             rect:(CGRect)rect
          context:(CGContextRef)context;

@end
