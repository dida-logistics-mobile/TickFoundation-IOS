//
//  DDSegmentedControl.m
//  DidaShipper
//
//  Created by yangbo on 17/3/15.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDSegmentedControl.h"
#import "UIView+RSAdditions.h"
#import "UIColor+Extension.h"

static CGFloat inset = 1;

@implementation DDSegmentedControl
{
    UIView  *_selectedTagView;
    NSMutableArray *_itemViews;
    
    BOOL _isMove;
    CGPoint _startPoint;
    NSArray *_titles;
}

-(instancetype)initWithTitles:(NSArray *)titles frame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        [self configDefaultColors];
        
        self.backgroundColor = _bgColor;
        self.layer.cornerRadius = CGRectGetHeight(frame)/2;
        self.clipsToBounds = YES;
        
        if(titles.count == 0){
            return self;
        }
        _titles = titles;
        
        _itemViews = [[NSMutableArray alloc] init];
        
        CGFloat itemWidth = (CGRectGetWidth(frame)-inset*2)/titles.count;
        _selectedTagView = [[UIView alloc] initWithFrame:CGRectMake(inset, inset, itemWidth, CGRectGetHeight(frame)-inset*2)];
        _selectedTagView.backgroundColor = _sliderColor;
        _selectedTagView.layer.cornerRadius = _selectedTagView.height/2;
        _selectedTagView.clipsToBounds = YES;
        
        [self addSubview:_selectedTagView];
        
        for(int i = 0; i < titles.count; i++){
            NSString *title = titles[i];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(itemWidth * i, 0, itemWidth, CGRectGetHeight(frame))];
            label.backgroundColor = [UIColor clearColor];
            label.font = _titleFont;
            label.text = title;
            label.textAlignment = NSTextAlignmentCenter;
            
            [self addSubview:label];
            [_itemViews addObject:label];
        }
        
        [self setSelectedIndex:0 animated:NO];
    }
    
    return self;
}

- (instancetype)initWithTitles:(NSArray *)titles frame:(CGRect)frame style:(DDSegmentedControlStyle)style{
    if(self = [super initWithFrame:frame]){
        _style = style;
        [self configDefaultColors];
        
        self.backgroundColor = _bgColor;
        if(_style == DDSegmentedControlRoundStyle){
            self.layer.cornerRadius = CGRectGetHeight(frame)/2;
        }
        self.clipsToBounds = YES;
        
        if(titles.count == 0){
            return self;
        }
        
        _titles = titles;

        _itemViews = [[NSMutableArray alloc] init];
        
        CGFloat itemWidth = 0;
        if(_style == DDSegmentedControlRoundStyle){
            itemWidth = (CGRectGetWidth(frame)-inset*2)/titles.count;
            _selectedTagView = [[UIView alloc] initWithFrame:CGRectMake(inset, inset, itemWidth, CGRectGetHeight(frame)-inset*2)];
            _selectedTagView.backgroundColor = _sliderColor;
            _selectedTagView.layer.cornerRadius = _selectedTagView.height/2;
            _selectedTagView.clipsToBounds = YES;
        }else if(_style == DDSegmentedControlLineStyle){
            itemWidth = CGRectGetWidth(frame)/titles.count;
            _selectedTagView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-_lineSliderHeight, itemWidth, _lineSliderHeight)];
            _selectedTagView.backgroundColor = _sliderColor;
        }else if(_style == DDSegmentedControlSliderEqualTitleWidth){
            NSString *title = _titles[0];
            CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:_titleFont}];
            CGFloat sizeWidth = size.width+20;
            itemWidth = CGRectGetWidth(frame)/titles.count;
            _selectedTagView = [[UIView alloc] initWithFrame:CGRectMake((itemWidth-sizeWidth)/2,self.height-_lineSliderHeight, sizeWidth, _lineSliderHeight)];
            _selectedTagView.backgroundColor = _sliderColor;
        }
        
        [self addSubview:_selectedTagView];
        
        for(int i = 0; i < titles.count; i++){
            NSString *title = titles[i];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(itemWidth * i, 0, itemWidth, CGRectGetHeight(frame))];
            label.backgroundColor = [UIColor clearColor];
            label.font = _titleFont;
            label.text = title;
            label.textAlignment = NSTextAlignmentCenter;
            
            [self addSubview:label];
            [_itemViews addObject:label];
        }
        
        [self setSelectedIndex:0 animated:NO];
    }
    
    return self;
}

- (void)configDefaultColors{
    _bgColor = [UIColor dd_colorWithHexString:@"e6e9ed"];
    _sliderColor = [UIColor dd_colorWithHexString:@"f5f7fa"];
    _selectedTextColor = [UIColor dd_colorWithHexString:@"00aff0"];
    _defaultTextColor = [UIColor dd_colorWithHexString:@"656d78"];
    _titleFont = [UIFont systemFontOfSize:15];
    _lineSliderHeight = 2;
}

- (void)setBgColor:(UIColor *)bgColor{
    _bgColor = bgColor;
    self.backgroundColor = _bgColor;
}

- (void)setSliderColor:(UIColor *)sliderColor{
    _sliderColor = sliderColor;
    _selectedTagView.backgroundColor = _sliderColor;
}

- (void)setDefaultTextColor:(UIColor *)defaultTextColor{
    _defaultTextColor = defaultTextColor;
    [self resetTextColors];
}

- (void)setSelectedTextColor:(UIColor *)selectedTextColor{
    _selectedTextColor = selectedTextColor;
    [self resetTextColors];
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    for(int i = 0; i <_itemViews.count; i++){
        UILabel *label = _itemViews[i];
        label.font = titleFont;
    }
}


- (void)resetTextColors{
    for(int i = 0; i <_itemViews.count; i++){
        UILabel *label = _itemViews[i];
        if(i == _selectedIndex){
            label.textColor = _selectedTextColor;
        }else{
            label.textColor = _defaultTextColor;
        }
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated{
    
    if(selectedIndex >= _itemViews.count || selectedIndex < 0){
        return;
    }
    
    _selectedIndex = selectedIndex;
    
    CGRect rect = CGRectZero;
    if(_style == DDSegmentedControlRoundStyle){
        CGFloat itemWidth = (CGRectGetWidth(self.frame)-inset*2)/_itemViews.count;
        rect = CGRectMake(inset+itemWidth*selectedIndex, inset, itemWidth, CGRectGetHeight(self.frame)-inset*2);
    }else if(_style == DDSegmentedControlLineStyle){
        CGFloat itemWidth = CGRectGetWidth(self.frame)/_itemViews.count;
        rect = CGRectMake(itemWidth*selectedIndex, self.height-_lineSliderHeight, itemWidth, _lineSliderHeight);
    }else if(_style == DDSegmentedControlSliderEqualTitleWidth){
        NSString *title = _titles[selectedIndex];
        CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:_titleFont}];
        CGFloat sizeWidth = size.width+20;
        CGFloat itemWidth = CGRectGetWidth(self.frame)/_itemViews.count;
        rect = CGRectMake(itemWidth*selectedIndex+(itemWidth-sizeWidth)/2,self.height-_lineSliderHeight, sizeWidth, _lineSliderHeight);
    }
    if(animated){
        [UIView animateWithDuration:.2 animations:^{
            _selectedTagView.frame = rect;
        }];
    }else{
        _selectedTagView.frame = rect;
    }
    
    [self resetTextColors];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _isMove = NO;
    _startPoint = [[touches anyObject] locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(_isMove)
        return;
    
    CGPoint point = [[touches anyObject] locationInView:self];
    if(ABS(_startPoint.x-point.x) > 30){
        _isMove = YES;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(_isMove)
        return;
    if(_itemViews.count == 0)
        return;
    
    CGPoint point = [[touches anyObject] locationInView:self];
    
    CGFloat itemWidth = (CGRectGetWidth(self.frame)-inset*2)/_itemViews.count;
    
    NSInteger index = (point.x - inset)/itemWidth;
    
    if(_selectedIndex == index)
        return;
    
    BOOL canSelected = YES;
    if(_shouldSelectedIndexBlock){
        canSelected = _shouldSelectedIndexBlock(index);
    }
    
    if(!canSelected){
        return;
    }
    
    [self setSelectedIndex:index animated:YES];
    
    if(_selectedIndexBlock){
        _selectedIndexBlock(index);
    }
}

@end
