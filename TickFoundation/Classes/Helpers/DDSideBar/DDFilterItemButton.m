//
//  DDFilterItemButton.m
//  Dida
//
//  Created by yangbo on 17/4/20.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDFilterItemButton.h"
#import "DDFilterView.h"
#import "UIColor+DDColor.h"
#import "UIColor+Extension.h"

@implementation DDFilterItemButton

- (void)setModel:(DDFilterItemModel *)model{
    _model = model;
    
    self.layer.cornerRadius = 15;
    self.clipsToBounds = YES;
    
    self.selected = model.selected;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self setTitle:_model.title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor dd_themeColor] forState:UIControlStateSelected];
    [self setTitleColor:[UIColor dd_colorWithHexString:@"656d78"] forState:UIControlStateNormal];
    self.layer.borderWidth = .5;
    
    [self removeTarget:self action:@selector(btnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(btnPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnPressed{
    if(_didTaped){
        _didTaped(_model,!self.isSelected);
    }
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    if(selected){
        self.backgroundColor = [UIColor dd_colorWithHexString:@"7fd8fc" alpha:.2];
        self.layer.borderColor = [UIColor dd_themeColor].CGColor;
    }else{
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor dd_separateColor].CGColor;
    }
}


@end
