//
//  DDEmptyView.m
//  空白页
//
//  Created by 李龙飞 on 17/4/7.
//  Copyright © 2017年 李龙飞. All rights reserved.
//

#import "DDEmptyView.h"
#import "UIColor+DDColor.h"

#define space 13

#define screenWidth [[UIScreen mainScreen] bounds].size.width

@interface DDEmptyView ()

@property (nonatomic,strong)    UIImageView *emptyImageView;
@property (nonatomic,strong)    UILabel *emptyLabel;


@end

@implementation DDEmptyView

-(instancetype)initWithEmptyImage:(NSString *)emptyImage emptyTitle:(NSString *)emptyTitle{
    if (self = [super init]) {
        
        
        
        _emptyImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:emptyImage]];
        [self addSubview:_emptyImageView];
        
        _emptyLabel = [[UILabel alloc] init];
        _emptyLabel.numberOfLines = 0;
        _emptyLabel.textColor = [UIColor dd_titleColor];
        _emptyLabel.font = [UIFont systemFontOfSize:17];
        _emptyLabel.text = emptyTitle;
        [self addSubview:_emptyLabel];
        
        [_emptyImageView sizeToFit];
        CGSize titleSize = [_emptyLabel sizeThatFits:CGSizeMake(screenWidth-60, 0)];
        _emptyLabel.frame = CGRectMake(0, 0, titleSize.width, titleSize.height);
        
        CGFloat width = MAX(_emptyLabel.frame.size.width, _emptyImageView.frame.size.width);
        CGFloat high = _emptyLabel.frame.size.height+_emptyImageView.frame.size.height+space;
        
        
        
        _emptyImageView.center = CGPointMake(width/2, _emptyImageView.frame.size.height/2);
        
        _emptyLabel.center = CGPointMake(width/2, _emptyImageView.frame.size.height+space+_emptyLabel.frame.size.height/2);
        
        self.frame=CGRectMake(0, 0, width, high);
        
    }
    return self;
}




@end
