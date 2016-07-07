//
//  TwoViewController.m
//  ZABNavigation
//
//  Created by zab on 16/7/6.
//  Copyright © 2016年 zab. All rights reserved.
//

#import "TwoViewController.h"
#import "ZABNavigationController.h"
@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TwoViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //两种设置navigationbar 隐藏的方法都可以
    //self.navigationBarHidden = YES;
   // self.navigationBar.hidden = YES;
    
    
    self.navigationBar.backgroundColor = [UIColor blueColor];
    self.navigationBar.titleColor = [UIColor orangeColor];
    self.navigationBar.titleFont = [UIFont systemFontOfSize:17];
    
    
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 0)];
    labelTitle.text = @"自定义titleview";
    labelTitle.backgroundColor = [UIColor orangeColor];
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.font = [UIFont systemFontOfSize:16.0];
    self.navigationBar.titleView = labelTitle;
    
   

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"back" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 40, 64);
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.navigationBar.leftItem = button;
    
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 64)];
    rightView.backgroundColor = [UIColor redColor];
    self.navigationBar.rightItem = rightView;
 
    
    NSLog(@"%@",NSStringFromClass([self.navigationController class]));
    
    // Do any additional setup after loading the view.
}
- (void)buttonAction{
    [self.navigationController popViewControllerAnimated:YES];
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
