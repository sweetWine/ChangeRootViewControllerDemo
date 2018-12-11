//
//  ContentViewController.m
//  ChangeRootViewControllerDemo
//
//  Created by 邱豪 on 2018/12/11.
//  Copyright © 2018 sweet wine. All rights reserved.
//

#import "ContentViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "Tool.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (void)dealloc
{
    NSLog(@"__ dealloc %@ __",NSStringFromClass(self.class));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configueUI];
}

- (void)configueUI
{
    self.view.backgroundColor = [UIColor cyanColor];
    UIButton *changeRootViewControllerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeRootViewControllerButton.frame = CGRectMake(0, 0, 100, 40);
    [changeRootViewControllerButton setTitle:@"更换控制器" forState:UIControlStateNormal];
    [changeRootViewControllerButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    changeRootViewControllerButton.backgroundColor = [UIColor whiteColor];
    [changeRootViewControllerButton addTarget:self action:@selector(changeRootViewControllerAction) forControlEvents:UIControlEventTouchUpInside];
    changeRootViewControllerButton.center = self.view.center;
    [self.view addSubview:changeRootViewControllerButton];
}

- (void)changeRootViewControllerAction
{
    // 直接使用跟控制器视图进行切换
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    [UIView transitionFromView:self.tabBarController.view toView:loginViewController.view duration:1.0f options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        [AppDelegate shareInstance].window.rootViewController = loginViewController;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
