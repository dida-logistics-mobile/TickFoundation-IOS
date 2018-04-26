//
//  NSDate+Extension.h
//  Pods
//
//  Created by yangbo on 16/12/15.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

///时间戳,精确到毫秒
- (NSInteger)dd_timeStamp;

///格式化字符串输出
- (NSString *)dd_stringWithFormat:(NSString *)format;

@end
