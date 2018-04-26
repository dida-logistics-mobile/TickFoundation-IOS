//
//  DDToastTipView.m
//  DidaShipper
//
//  Created by yangbo on 17/3/15.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDToastTipView.h"
#import <Masonry/Masonry.h>
#import "UIView+RSAdditions.h"
#import "UIColor+Extension.h"

@implementation DDToastTipView

+ (DDToastTipView *)showToastTipWithContent:(NSString *)content
                                   duration:(NSTimeInterval)duration
                     isTapBackgroundRemoved:(BOOL)isTapBackgroundRemoved{
    DDToastTipView *tipview  = [DDToastTipView toastTipViewWithContent:content];
    tipview.isTapBackgroundRemoved = isTapBackgroundRemoved;
    [tipview showWithAnimated:YES];
    [tipview removeAfterDelay:duration animated:YES];
    return tipview;
}

+ (DDToastTipView *)toastTipViewWithContent:(NSString *)content{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 270, 0)];
    contentView.layer.cornerRadius = 10;
    contentView.clipsToBounds = YES;
    contentView.backgroundColor = [UIColor whiteColor];
    
    CGFloat xoffset = 10;
    UIFont *font = [UIFont boldSystemFontOfSize:13];
    CGSize size = [content boundingRectWithSize:CGSizeMake(contentView.width-xoffset*2, 1000)
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil].size;
    contentView.height = size.height+88;
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.text = content;
    textLabel.numberOfLines = 0;
    textLabel.font = font;
    textLabel.textColor = [UIColor dd_colorWithHexString:@"434a54"];
    [contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(size.width+5, size.height+5));
        make.centerX.equalTo(contentView.mas_centerX);
        make.centerY.equalTo(contentView.mas_centerY);
    }];
    
    DDToastTipView *tipView = [[DDToastTipView alloc] initWithContentView:contentView];
    
    return tipView;
}

@end
