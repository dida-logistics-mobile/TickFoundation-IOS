//
//  DDPlaceHolderTextView.m
//  DidaShipper
//
//  Created by yangbo on 17/3/23.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDPlaceHolderTextView.h"
#import "UIColor+Extension.h"

#define PLACE_HOLDER_LABEL_TAG 1001


@interface DDPlaceHolderTextView ()

@property (nonatomic, retain) UILabel *placeHolderLabel;


@end

@implementation DDPlaceHolderTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



#pragma mark - Private
- (void)textChanged:(NSNotification *)notification {
    if(self.text.length == 0) {
        [[self viewWithTag:PLACE_HOLDER_LABEL_TAG] setAlpha:1];
    } else {
        [[self viewWithTag:PLACE_HOLDER_LABEL_TAG] setAlpha:0];
    }
}

- (void)drawRect:(CGRect)rect {
    if( [[self placeholder] length] > 0 ) {
        if (_placeHolderLabel == nil ) {
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, 8, self.bounds.size.width,0)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = [UIColor dd_colorWithHexString:@"cdcdcd"];
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = PLACE_HOLDER_LABEL_TAG;
            [self addSubview:_placeHolderLabel];
        }
        
        _placeHolderLabel.text = self.placeholder;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 ) {
        [[self viewWithTag:PLACE_HOLDER_LABEL_TAG] setAlpha:1];
    }
}

#pragma mark - Setter
- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

@end
