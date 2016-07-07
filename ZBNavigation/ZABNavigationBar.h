//
//  ZABNavigationBar.h
//  ZABNavigation
//
//  Created by zab on 16/7/6.
//  Copyright © 2016年 zab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZABNavigationBarDelegate <NSObject>

- (void)didClickBackitem;

@end

@interface ZABNavigationBar : UIView

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) UIView *titleView;
@property(nonatomic, strong) UIView *leftItem;
@property(nonatomic, strong) UIView *rightItem;
@property(nonatomic, strong) UIButton *backItem;
@property(nonatomic, strong) UIView *barLine;
@property(nonatomic, strong) UIColor *barBackColor;
@property(nonatomic, strong) UIColor *titleColor;
@property(nonatomic, strong) UIFont *titleFont;
@property(nonatomic, assign) CGFloat naviBarHeight; //navigationbar 高度
@property(nonatomic, assign) BOOL hideBarLine;

@property (nonatomic, weak) id<ZABNavigationBarDelegate> delegate;

@end
