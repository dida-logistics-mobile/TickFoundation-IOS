//
//  DDWeakTimer.m
//  Pods
//
//  Created by yangbo on 16/12/15.
//
//

#import "DDWeakTimer.h"

@interface DDWeakTimerTarget : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer* timer;

@end

@implementation DDWeakTimerTarget

- (void) fire:(NSTimer *)timer {
    if(_target) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.selector withObject:timer.userInfo afterDelay:0.0f];
#pragma clang diagnostic pop
    } else {
        [self.timer invalidate];
    }
}

@end

@implementation DDWeakTimer

+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats {
    DDWeakTimerTarget* timerTarget = [[DDWeakTimerTarget alloc] init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    NSTimer * realTimer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                           target:timerTarget
                                                         selector:@selector(fire:)
                                                         userInfo:userInfo
                                                          repeats:repeats];
    timerTarget.timer = realTimer;
    return realTimer;
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(void (^)(id userInfo))block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats {
    NSMutableArray *userInfoArray = [NSMutableArray arrayWithObject:[block copy]];
    if (userInfo != nil) {
        [userInfoArray addObject:userInfo];
    }
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(_timerBlockInvoke:)
                                       userInfo:[userInfoArray copy]
                                        repeats:repeats];
}

+ (void)_timerBlockInvoke:(NSArray*)userInfo {
    void (^block)(id userInfo) = userInfo[0];
    id info = nil;
    if (userInfo.count == 2) {
        info = userInfo[1];
    }
    if (block) {
        block(info);
    }
}

@end
