//
//  NSString+Extension.m
//  Pods
//
//  Created by yangbo on 16/12/15.
//
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (NSString*)dd_randomUUIDString
{
    CFUUIDRef unique = CFUUIDCreate(kCFAllocatorDefault);
    
    NSString *result = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, unique));
    
    CFRelease(unique);
    
    return [result stringByReplacingOccurrencesOfString:@"-" withString:@""];
}

- (NSString *)dd_stringByTrimmingWhiteSpaceAndNewlineCharacter
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (id)dd_jsonObject {
    NSError *error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
    if(error){
        NSLog(@"dd_jsonObject parse error:%@",error);
    }
    return object;
}

+ (NSString *)dd_jsonString:(id)jsonObject{
    
    if(jsonObject == nil)
    {
        NSLog(@"dd_jsonString encode error: jsonObject is nil");
        return nil;
    }
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:NSJSONWritingPrettyPrinted error:&error];
    if(error){
        NSLog(@"dd_jsonString encode error:%@",error);
    }
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSDate *)dd_dateWithFormat:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:self];
}

+ (NSString *)dd_floatFormatString:(CGFloat)floatValue{
    if(floatValue > 100000000){
        return [NSString stringWithFormat:@"%.2f亿",floatValue/100000000.0f];
    }else if(floatValue > 10000){
        return [NSString stringWithFormat:@"%.2f万",floatValue/10000.0f];
    }else{
        return [NSString stringWithFormat:@"%.2f",floatValue];
    }
}

+ (NSString *)dd_floatFormatStringWithFourDecimal:(CGFloat)floatValue{
    NSString *value = nil;
    NSString *unit = @"";
    if(floatValue > 100000000){
        unit = @"亿";
        value = [NSString stringWithFormat:@"%.4f",floatValue/100000000.0f];
    }else if(floatValue > 10000){
        unit = @"万";
        value = [NSString stringWithFormat:@"%.4f",floatValue/10000.0f];
    }else{
        value = [NSString stringWithFormat:@"%.4f",floatValue];
    }
    
    while (1) {
        
        if([value rangeOfString:@"."].location == NSNotFound){
            break;
        }
        
        if([value hasSuffix:@"."]){
            value = [value substringToIndex:value.length-1];
            break;
        }
        
        if(value.length > 0 && [value hasSuffix:@"0"]){
            value = [value substringToIndex:value.length-1];
        }else{
            break;
        }
    }
    
    return [value stringByAppendingString:unit];
}

+ (NSString *)dd_stringWithFloat:(CGFloat)floatValue{
    NSDecimalNumber *number = [[NSDecimalNumber alloc] initWithDouble:floatValue];
    return [number stringValue];
}

+ (NSString *)dd_stringWithFloatWithFourDecimal:(CGFloat)floatValue{
    NSString *value = [NSString stringWithFormat:@"%.4f",floatValue];
    
    while (1) {
        if([value rangeOfString:@"."].location == NSNotFound){
            break;
        }
        
        if([value hasSuffix:@"."]){
            value = [value substringToIndex:value.length-1];
            break;
        }
        
        if(value.length > 0 && [value hasSuffix:@"0"]){
            value = [value substringToIndex:value.length-1];
        }else{
            break;
        }
    }
    
    return value;
}

+ (NSString *)dd_stringWithFloatWithTwoDecimal:(CGFloat)floatValue{
    NSString *value = [NSString stringWithFormat:@"%.2f",floatValue];
    
    return value;
}

+ (NSString *)dd_stringWithFloatWithCommaAndTwoDecimal:(CGFloat)floatValue{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:@"###,##0.00;"];
    
    NSString *value = [formatter stringFromNumber:@(floatValue)];
    
    return value;
}

@end
