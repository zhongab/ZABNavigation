//
//  ZABNavigationBar.m
//  ZABNavigation
//
//  Created by zab on 16/7/6.
//  Copyright © 2016年 zab. All rights reserved.
//

#import "ZABNavigationBar.h"
#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)

static CGFloat barItemMargin = 10.0;

@interface ZABNavigationBar()
@property(nonatomic, strong) UILabel *labelTitle;
@end

@implementation ZABNavigationBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if(self){
        
        _naviBarHeight = 64.0;
        _barBackColor = [UIColor colorWithWhite:0.90 alpha:1.0];
        _titleColor = [UIColor blackColor];
        _titleFont = [UIFont systemFontOfSize:15.0];
        _hideBarLine = NO;
        [self initUI];
    }
    
    return self;
}

- (instancetype)init{
    return [self initWithFrame:CGRectZero];
}

- (void)initUI{
    self.frame = CGRectMake(0, 0, SCREENWIDTH, _naviBarHeight);
    self.backgroundColor = _barBackColor;
    self.backItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backItem.frame = CGRectMake(0, 20, 30, 44);
    [self.backItem setImage:[UIImage imageNamed:@"button_back"] forState:UIControlStateNormal];
    [self.backItem addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backItem];
    
    self.labelTitle = [[UILabel alloc] init];
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    self.labelTitle.lineBreakMode = NSLineBreakByTruncatingTail;
    [self addSubview:self.labelTitle];
    
    self.barLine.backgroundColor = [UIColor colorWithWhite:0.639 alpha:1.000];
    self.barLine.frame = CGRectMake(0, _naviBarHeight - 0.5, SCREENWIDTH, 0.5);
    [self addSubview:self.barLine];
}
- (void)updateUI{
    
    CGFloat titleWidth = SCREENWIDTH - self.backItem.frame.size.width*2 - barItemMargin*2;
    
    if (_leftItem && _rightItem) {
        
        
        
        _leftItem.frame = CGRectMake(barItemMargin, 20, _leftItem.frame.size.width, _naviBarHeight - 20);
        
        _rightItem.frame = CGRectMake(SCREENWIDTH - barItemMargin - _rightItem.frame.size.width, 20, _rightItem.frame.size.width,_naviBarHeight - 20);
        
        CGFloat width = MAX(_leftItem.frame.size.width,_rightItem.frame.size.width);

        titleWidth = SCREENWIDTH - width*2 - barItemMargin*2;
        
        
        
    }
    else if (_leftItem) {
        _leftItem.frame = CGRectMake(barItemMargin, 20, _leftItem.frame.size.width, _naviBarHeight - 20);
        
        titleWidth = SCREENWIDTH - self.leftItem.frame.size.width*2 - barItemMargin*2;
    }
    else if (_rightItem) {
        
        _rightItem.frame = CGRectMake(SCREENWIDTH - barItemMargin - _rightItem.frame.size.width, 20, _rightItem.frame.size.width,_naviBarHeight - 20);

         titleWidth = SCREENWIDTH - self.rightItem.frame.size.width*2 - barItemMargin*2;
    }else{
         titleWidth = SCREENWIDTH - self.backItem.frame.size.width*2 - barItemMargin*2;
    }
    
    if (_titleView) {
        if (_titleView.frame.size.width > titleWidth) {
            _titleView.frame = CGRectMake((SCREENWIDTH - titleWidth)/2.0, 20, titleWidth, _naviBarHeight - 20);
        }else{
            _titleView.frame = CGRectMake((SCREENWIDTH - _titleView.frame.size.width)/2.0, 20, _titleView.frame.size.width, _naviBarHeight - 20);
        }
    }
    else{
       _labelTitle.frame = CGRectMake((SCREENWIDTH - titleWidth)/2.0, 20, titleWidth, _naviBarHeight - 20);
    }
    
    _barLine.frame = CGRectMake(0, _naviBarHeight - 0.5, SCREENWIDTH, 0.5);
   
}

#pragma mark Setter
- (void)setTitle:(NSString *)title{
    if (!title) {
        return;
    }
    if ([title isEqualToString:_labelTitle.text]) {
        return;
    }
    _title = title;
    self.labelTitle.text = title;
    [self updateUI];
}
- (void)setLeftItem:(UIView *)leftItem{
    if (leftItem) {
        [_backItem removeFromSuperview];
        _leftItem = leftItem;
        [self addSubview:_leftItem];
    }
   [self updateUI];
}
- (void)setRightItem:(UIView *)rightItem{
    if (rightItem) {
        _rightItem = rightItem;
        [self addSubview:_rightItem];
    }
    [self updateUI];
}
- (void)setTitleView:(UIView *)titleView{
    if (titleView) {
        [_labelTitle removeFromSuperview];
        _titleView = titleView;
        [self addSubview:_titleView];
    }
    [self updateUI];
}
- (void)setBarLine:(UIView *)barLine{
    if (barLine) {
        [_barLine removeFromSuperview];
        _barLine = barLine;
    }
    [self updateUI];
}

- (void)setBarHeight:(CGFloat)barHeight{
    if (_naviBarHeight) {
        _naviBarHeight = barHeight;
    }
    [self updateUI];
}
- (void)setBarBackColor:(UIColor *)barBackColor{
    if (barBackColor) {
        _barBackColor = barBackColor;
        self.backgroundColor = barBackColor;
    }
}
- (void)setTitleColor:(UIColor *)titleColor{
    if (titleColor) {
        _titleColor = titleColor;
        self.labelTitle.textColor = titleColor;
    }
    
}
- (void)setTitleFont:(UIFont *)titleFont{
    if (titleFont) {
        _titleFont = titleFont;
        self.labelTitle.font = titleFont;
        
    }
}
- (void)setHideBarLine:(BOOL)hideBarLine{
    _barLine.hidden = hideBarLine;
}

- (void)popViewController{
    if ([_delegate respondsToSelector:@selector(didClickBackitem)]) {
        [_delegate didClickBackitem];
    }
}


@end
