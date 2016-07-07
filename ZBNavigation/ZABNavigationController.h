//
//  ZABNavigationController.h
//  ZABNavigation
//
//  Created by zab on 16/7/6.
//  Copyright © 2016年 zab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZABNavigationBar.h"

@interface UIViewController (ZABNavigationBar)
@property (nonatomic, strong) ZABNavigationBar *navigationBar;
@property (nonatomic, getter=isNavigationBar) BOOL navigationBarHidden;
@property (nonatomic, copy) NSString *title;

@end

@interface ZABNavigationController : UINavigationController

@property (nonatomic, strong) ZABNavigationBar *rootViewNavgationBar;

@property (nonatomic,assign) BOOL fullScreenPopGesture;
/*
    返回手势距离页面左边的范围
 */
@property (nonatomic,assign) CGFloat distancePopGesture;
@end
