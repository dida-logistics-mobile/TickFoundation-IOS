//
//  DDBatchOSSTask.h
//  Dida
//
//  Created by yangbo on 17/5/4.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDBatchOSSTask : NSObject

- (void)startWithOSSTasks:(NSArray *)tasks complete:(void(^)(BOOL success,NSArray *tasks,NSError *error))complete;

@end
