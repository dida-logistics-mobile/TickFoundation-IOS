//
//  NSBundle+DDFoundation.m
//  Pods
//
//  Created by yangbo on 17/1/9.
//
//

#import "NSBundle+DDFoundation.h"

@implementation NSBundle (DDFoundation)
    
+ (NSString *)dd_localizedStringForKey:(NSString *)key {
    return [self dd_localizedStringForKey:key value:@""];
}
    
+ (NSString *)dd_localizedStringForKey:(NSString *)key value:(NSString *)value {
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"DiDaFoundation" ofType:@"bundle"]];
    }
    NSString *value1 = [bundle localizedStringForKey:key value:value table:nil];
    return value1;
}
    
@end
