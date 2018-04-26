//
//  NSBundle+DDFoundation.h
//  Pods
//
//  Created by yangbo on 17/1/9.
//
//

#import <Foundation/Foundation.h>

#define DiDaLocalizedString(str) [NSBundle dd_localizedStringForKey:str]

@interface NSBundle (DDFoundation)

+ (NSString *)dd_localizedStringForKey:(NSString *)key;
    
@end
