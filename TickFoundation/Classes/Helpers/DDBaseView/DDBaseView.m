//
//  DDBaseView.m
//  Pods
//
//  Created by yangbo on 2017/7/12.
//
//

#import "DDBaseView.h"

@implementation DDBaseView

+ (instancetype)viewFromNib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

@end
