//
//  DDAliOSSManager.h
//  Dida
//
//  Created by yangbo on 17/5/4.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDPublicMacro.h"

@interface DDAliOSSManager : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER

- (void)startWithDebug:(BOOL)debug host:(NSString *)host;

- (void)uploadImage:(UIImage *)image complete:(void(^)(BOOL success,NSString *objectKey,NSError *error))complete;
- (void)uploadImages:(NSArray *)images complete:(void(^)(BOOL success,NSArray *objectKeys,NSError *error))complete;

@end
