//
//  NSString+Validate.m
//  Dida
//
//  Created by yangbo on 17/1/5.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)

- (BOOL)dd_isVehiclePlate{
    
    if(self.length != 7)
        return NO;
    
    return YES;
}

- (BOOL)dd_isMobileNumber{
    if(self.length != 11)
        return NO;
    
    NSString *regex = @"^1\\d{10}$";
    
    return [self dd_validWithRegex:regex];
}

- (BOOL)dd_isIdCard{
    NSString *regex = @"^[0-9a-zA-Z]{15}$|^[0-9a-zA-Z]{18}$";
    return [self dd_validWithRegex:regex];
}

- (BOOL)dd_isMoneyFormat{
    NSString *regex = @"^(([1-9]\\d{0,9})|0)(\\.\\d{1,2})?$";//@"^[0-9]{1,10}$|^[0-9]{0,9}\\.[0-9]{0,1}$|^[0-9]{0,8}\\.[0-9]{0,2}$";
    return [self dd_validWithRegex:regex];
}

- (BOOL)dd_isWeightFormat{
    NSString *regex = @"^(([1-9]\\d{0,9})|0)(\\.\\d{1,2})?$";//@"^[0-9]{1,10}$|^[0-9]{0,9}\\.[0-9]{0,1}$|^[0-9]{0,8}\\.[0-9]{0,2}$";
    return [self dd_validWithRegex:regex];
}

- (BOOL)dd_validWithRegex:(NSString *)regex{
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];

}



@end
