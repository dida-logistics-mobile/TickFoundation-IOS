//
//  UIColor+DDColor.m
//  DidaShipper
//
//  Created by yangbo on 17/3/24.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "UIColor+DDColor.h"
#import "UIColor+Extension.h"

@implementation UIColor (DDColor)

+ (UIColor *)dd_separateColor{ //CCD1D9 分割线
    return [UIColor dd_colorWithHexString:@"CCD1D9"];
}

+ (UIColor *)dd_inputTextColor{ //434a54 输入框
    return [UIColor dd_colorWithHexString:@"434a54"];
}

+ (UIColor *)dd_titleColor{ //aab2bd cell标题
    return [UIColor dd_colorWithHexString:@"aab2bd"];
}

+ (UIColor *)dd_bgColor{ //f5f7fa 背景
    return [UIColor dd_colorWithHexString:@"f5f7fa"];
}

+ (UIColor *)dd_themeColor{ //00aff0 主题色
    return [UIColor dd_colorWithHexString:@"f5b74c"];
}

+ (UIColor *)dd_disableBtnColor{ //CCD1D9 按钮disable状态
    return [UIColor dd_colorWithHexString:@"CCD1D9"];
}

@end
