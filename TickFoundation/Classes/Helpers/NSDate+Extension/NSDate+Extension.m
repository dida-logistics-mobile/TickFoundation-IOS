//
//  NSDate+Extension.m
//  Pods
//
//  Created by yangbo on 16/12/15.
//
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

- (NSInteger)dd_timeStamp{
    return (NSInteger)([[NSDate date] timeIntervalSince1970]*1000);
}

- (NSString *)dd_stringWithFormat:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:self];
}

@end
