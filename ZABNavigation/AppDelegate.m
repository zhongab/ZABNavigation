//
//  AppDelegate.m
//  ZABNavigation
//
//  Created by zab on 16/7/6.
//  Copyright © 2016年 zab. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ZABNavigationController.h"
#import "FourViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
#warning  使用时全局导入ZABNavigationController
    
#warning navigationController 测试

    OneViewController *vc1 = [[OneViewController alloc] init];
    ZABNavigationController *navi1 = [[ZABNavigationController alloc] initWithRootViewController:vc1];
    //navi1.distancePopGesture = 60.0;
    self.window.rootViewController = navi1;
    
    
#warning tabbarController 测试
//    OneViewController *vc1 = [[OneViewController alloc] init];
//    ZABNavigationController *navi1 = [[ZABNavigationController alloc] initWithRootViewController:vc1];
//    
//    FourViewController *vc2 = [[FourViewController alloc] init];
//    ZABNavigationController *navi2 = [[ZABNavigationController alloc] initWithRootViewController:vc2];
//
//    navi1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"1" image:nil selectedImage:nil];
//    navi2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"2" image:nil selectedImage:nil];
//    
//    UITabBarController *tabbarcontroller = [[UITabBarController alloc] init];
//    tabbarcontroller.viewControllers = @[navi1,navi2];
//    self.window.rootViewController = tabbarcontroller;
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
