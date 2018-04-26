//
//  NSString+Validate.h
//  Dida
//
//  Created by yangbo on 17/1/5.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 银行账号：1~25位，纯数字
 手机号码：11位，纯数字
 身份证号码：15、18位，数字和字母的组合
 邮编：6位，纯数字
 社会信用代码/纳税人识别码：15位、18或者20位，数字和字母
 驾驶证编码：即身份证
 车牌号：7位
 金额：做多10位，最多2位小数
 吨位/立方：最多10位，最多2位小数
 */
@interface NSString (Validate)

///是否是车牌号
- (BOOL)dd_isVehiclePlate;

///是否是手机号
- (BOOL)dd_isMobileNumber;

///是否是身份证号
- (BOOL)dd_isIdCard;

///金额验证
- (BOOL)dd_isMoneyFormat;

///重量验证
- (BOOL)dd_isWeightFormat;
@end
