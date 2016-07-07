# ZABNavigationrning  使用时全局导入ZABNavigationController
    
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
