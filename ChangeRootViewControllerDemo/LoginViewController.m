//
//  LoginViewController.m
//  ChangeRootViewControllerDemo
//
//  Created by 邱豪 on 2018/12/11.
//  Copyright © 2018 sweet wine. All rights reserved.
//

#import "LoginViewController.h"
#import "RootTabBarController.h"
#import "AppDelegate.h"
#import "Tool.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    self.view.backgroundColor = [UIColor orangeColor];
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
    // 通过中间视图进行视图转换
    UIImageView *transitionView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RootTabBarController *rootController = [[RootTabBarController alloc] init];
    // 将loginViewController.view绘制成图片
    transitionView.image = [Tool paintingPictureWithView:rootController.view];
    [UIView transitionFromView:self.view toView:transitionView duration:1.0f options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        [transitionView removeFromSuperview];
        [AppDelegate shareInstance].window.rootViewController = rootController;
    }];

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
