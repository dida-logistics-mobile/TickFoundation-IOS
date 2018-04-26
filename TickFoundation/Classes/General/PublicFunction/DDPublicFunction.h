//
//  PublicFunction.h
//  Dida
//
//  Created by yangbo on 16/12/27.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>

//qbType
#define QbOutbit    @"1"   //竞价
#define QbRob       @"0"      //抢单

//chargeMode
#define ChargeUnitPrice     @"01" //单价
#define ChargeWholePrice    @"02" //整车价

//goodsStyle
#define GoodStyleZH     @"ZH" //重货
#define GoodStylePH     @"PH" //泡货

//ifQuote
#define NotQuoto        @"0"    //未报过价
#define HasQuoto        @"1"    //已经报过价

@interface DDPublicFunction : NSObject

///货物类型->货物单位
+ (NSString *)unitWithGoodStyle:(NSString *)goodStyle;

///价格单位 元/吨 元/立方
+ (NSString *)priceUnitWithGoodStyle:(NSString *)goodStyle;

///
+ (void)callWithPhone:(NSString *)phone view:(UIView *)view;
@end
