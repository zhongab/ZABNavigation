//
//  ZABNavigationController.m
//  ZABNavigation
//
//  Created by zab on 16/7/6.
//  Copyright © 2016年 zab. All rights reserved.
//

#import "ZABNavigationController.h"
#import <objc/runtime.h>

@implementation UIViewController (ZABNavigationBar)

@dynamic navigationBar;
@dynamic navigationBarHidden;
@dynamic title;
- (ZABNavigationBar *)navigationBar{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setNavigationBar:(ZABNavigationBar *)navigationBar{
    objc_setAssociatedObject(self, @selector(navigationBar), navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isNavigationBar{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (void)setNavigationBarHidden:(BOOL)navigationBarHidden{
    objc_setAssociatedObject(self, @selector(isNavigationBar), @(navigationBarHidden), OBJC_ASSOCIATION_ASSIGN);
}
- (NSString *)title{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setTitle:(NSString *)title{
    objc_setAssociatedObject(self, @selector(title), title, OBJC_ASSOCIATION_COPY);
}
@end

@interface ZABNavigationController ()<ZABNavigationBarDelegate,UIGestureRecognizerDelegate>

@end

@implementation ZABNavigationController


- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        _distancePopGesture = [UIScreen mainScreen].bounds.size.width;
        [self initController];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _distancePopGesture = [UIScreen mainScreen].bounds.size.width;
 
    }
    return self;
}

- (void)initController{
    self.navigationBar.hidden = YES;
    self.rootViewNavgationBar = [[ZABNavigationBar alloc] init];
    self.rootViewNavgationBar.delegate = self;
    self.topViewController.navigationBar = self.rootViewNavgationBar;
    [self.topViewController.view addSubview:self.rootViewNavgationBar];
    self.rootViewNavgationBar.title = self.topViewController.title;
    
    if (self.childViewControllers.count == 1) {
        self.rootViewNavgationBar.backItem.hidden = YES;
    }
    if (self.topViewController.navigationBarHidden || self.topViewController.navigationBar.hidden) {
         self.rootViewNavgationBar.hidden = YES;
    }
    
    
    self.fullScreenPopGesture = YES;
    if (self.fullScreenPopGesture) {
        id target = self.interactivePopGestureRecognizer.delegate;
        SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:internalAction];
        panGesture.delegate = self;
        [self.view addGestureRecognizer:panGesture];
        panGesture.maximumNumberOfTouches = 1;
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        ZABNavigationBar *naviBar = [[ZABNavigationBar alloc] init];
        naviBar.delegate = self;
        viewController.navigationBar = naviBar;
        [viewController.view addSubview:naviBar];
        if (viewController.navigationBarHidden || viewController.navigationBar.hidden) {
            naviBar.hidden = YES;
        }
        naviBar.title = viewController.title;
    }
    [super pushViewController:viewController animated:animated];
}
- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    return [super popViewControllerAnimated:animated];
}

- (void)didClickBackitem{
    [self popViewControllerAnimated:YES];
}

#pragma mark - Delegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint beginningLocation = [gestureRecognizer locationInView:gestureRecognizer.view];
    CGFloat maxAllowedInitialDistance = self.distancePopGesture;
    if (maxAllowedInitialDistance > 0 && beginningLocation.x > maxAllowedInitialDistance) {
        return NO;
    }
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
