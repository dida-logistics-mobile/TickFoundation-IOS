//
//  DDBatchOSSTask.m
//  Dida
//
//  Created by yangbo on 17/5/4.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDBatchOSSTask.h"
#import <AliyunOSSiOS/AliyunOSSiOS.h>

static NSMutableArray *batchTaskArray = nil;

@implementation DDBatchOSSTask
{
    NSInteger _finishCount;
    BOOL _finished;
}

- (void)startWithOSSTasks:(NSArray *)tasks complete:(void(^)(BOOL success,NSArray *tasks,NSError *error))complete{
    _finishCount = 0;
    _finished = NO;
    [DDBatchOSSTask addBatchTask:self];
    for(OSSTask *task in tasks){
        [task continueWithBlock:^id(OSSTask *task) {
            
            if(_finished){
                return nil;
            }
            
            if (!task.error) {
                _finishCount++;
                if(_finishCount == tasks.count){
                    _finished = YES;
                    complete(YES,tasks,nil);
                    [DDBatchOSSTask removeBatchTask:self];
                }
            } else {
                _finished = YES;
                complete(NO,nil,task.error);
            }
            return nil;
        }];
    }
}

+ (void)addBatchTask:(DDBatchOSSTask *)task{
    
    if(task == nil){
        return;
    }
    
    if(batchTaskArray == nil){
        batchTaskArray = [[NSMutableArray alloc] init];
    }
    
    [batchTaskArray addObject:task];
}

+ (void)removeBatchTask:(DDBatchOSSTask *)task{
    [batchTaskArray removeObject:task];
}

@end
