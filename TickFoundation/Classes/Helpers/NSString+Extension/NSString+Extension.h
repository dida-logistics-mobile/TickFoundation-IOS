//
//  NSString+Extension.h
//  Pods
//
//  Created by yangbo on 16/12/15.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

///生成随机字符串
+ (NSString *)dd_randomUUIDString;

///去除空格
- (NSString *)dd_stringByTrimmingWhiteSpaceAndNewlineCharacter;

///string->json
- (id)dd_jsonObject;

///json->string
+ (NSString *)dd_jsonString:(id)jsonObject;

///字符串转日期
- (NSDate *)dd_dateWithFormat:(NSString *)format;

///float转字符串 用于显示 保留两位小数
+ (NSString *)dd_floatFormatString:(CGFloat)floatValue;

///float转字符串 用于显示 最多保留四位小数
+ (NSString *)dd_floatFormatStringWithFourDecimal:(CGFloat)floatValue;

///float转字符串
+ (NSString *)dd_stringWithFloat:(CGFloat)floatValue;

///float转字符串，最多保留四位小数
+ (NSString *)dd_stringWithFloatWithFourDecimal:(CGFloat)floatValue;

///float转字符串，最多保留两位小数
+ (NSString *)dd_stringWithFloatWithTwoDecimal:(CGFloat)floatValue;

///float转字符串，保留两位小数 逗号分隔
+ (NSString *)dd_stringWithFloatWithCommaAndTwoDecimal:(CGFloat)floatValue;

@end
