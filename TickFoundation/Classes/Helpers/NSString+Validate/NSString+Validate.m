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
    NSString *regex = @"^(([1-9]\\d{0,9})|0)(\\.\\d{1,4})?$";//@"^[0-9]{1,10}$|^[0-9]{0,9}\\.[0-9]{0,1}$|^[0-9]{0,8}\\.[0-9]{0,2}$";
    return [self dd_validWithRegex:regex];
}

///社会信用代码
- (BOOL)dd_isUcodeRegularFormat{
    NSString *regex = @"^[\\da-zA-Z]{15}$|^[\\da-zA-Z]{18}$|^[\\da-zA-Z]{20}$";
    return [self dd_validWithRegex:regex];
}

///密码校验
- (BOOL)dd_isPwdFormat{
    NSString *regex = @"^(?![\\d]+$)(?![a-zA-Z]+$)(?![^\\da-zA-Z]+$).{6,20}$";
    return [self dd_validWithRegex:regex];
}

///用户名校验
- (BOOL)dd_isUsernameFormat{
    NSString *regex = @"^[A-Za-z][A-Za-z0-9]{0,19}$";
    return [self dd_validWithRegex:regex];
}

- (BOOL)dd_isMobileOrTelephoneFormat{
    NSString *regex = @"(^(0[0-9]{2,3}[\\-]?)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?$)|(^((\\(\\d{3}\\))|(\\d{3}[\\-]?))?(1\\d{10})$)";
    return [self dd_validWithRegex:regex];
}

- (BOOL)dd_isPostalcode{
    NSString *regex = @"[0-9]\\d{5}(?!\\d)";
    return [self dd_validWithRegex:regex];
}

- (BOOL)dd_isBankCard{
    NSString *regex = @"^\\d{15,30}$";
    return [self dd_validWithRegex:regex];
}

- (BOOL)dd_validWithRegex:(NSString *)regex{
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];

}



@end
