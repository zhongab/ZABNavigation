//
//  FourViewController.m
//  ZABNavigation
//
//  Created by zab on 16/7/7.
//  Copyright © 2016年 zab. All rights reserved.
//

#import "FourViewController.h"
#import "ZABNavigationController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"fourviewcontroller";
    self.navigationBarHidden = YES;
    
    
    
    UIButton *buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonTwo setTitle:@"push Two" forState:UIControlStateNormal];
    buttonTwo.frame = CGRectMake(0, 0, 100, 50);
    buttonTwo.center = self.view.center;
    [self.view addSubview:buttonTwo];
    [buttonTwo addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [buttonTwo setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    
    UIButton *buttonThree = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonThree setTitle:@"push Three" forState:UIControlStateNormal];
    buttonThree.frame = CGRectMake(0, 0, 100, 50);
    buttonThree.center = CGPointMake(self.view.center.x,self.view.center.y + 60);
    [self.view addSubview:buttonThree];
    [buttonThree addTarget:self action:@selector(buttonThreeAction) forControlEvents:UIControlEventTouchUpInside];
    [buttonThree setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
}
- (void)buttonAction{
    TwoViewController *vc = [[TwoViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)buttonThreeAction{
    ThreeViewController *controller = [[ThreeViewController alloc] init];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
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
