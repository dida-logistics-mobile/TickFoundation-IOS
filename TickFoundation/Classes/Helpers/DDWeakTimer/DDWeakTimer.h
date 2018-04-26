//
//  DDWeakTimer.h
//  Pods
//
//  Created by yangbo on 16/12/15.
//
//

#import <Foundation/Foundation.h>

///定时器,不持有target
@interface DDWeakTimer : NSObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(void (^)(id userInfo))block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats;
@end
