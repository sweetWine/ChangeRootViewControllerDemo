//
//  RootTabBarController.m
//  ChangeRootViewControllerDemo
//
//  Created by 邱豪 on 2018/12/11.
//  Copyright © 2018 sweet wine. All rights reserved.
//

#import "RootTabBarController.h"
#import "ContentViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)dealloc
{
    NSLog(@"__ dealloc %@ __",NSStringFromClass(self.class));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configueViewControllers];
    [self configueUI];
    [self configueSeparatorLine];
}

// 添加三级控制器
- (void)configueViewControllers
{
    ContentViewController *homePageViewController = [[ContentViewController alloc] init];
    NSArray *viewControllerArray = @[homePageViewController,];
    self.viewControllers = viewControllerArray;
}

// 设置标题图片
- (void)configueUI
{
    NSArray *titleArray = @[@"首页"];
    NSArray *imageArray = @[@"HomePage_normal"];
    NSArray *selectedImageArray = @[@"HomePage_selected"];
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        UIViewController *viewController = self.viewControllers[i];
        viewController.tabBarItem.title = titleArray[i];
        // 设置title大小以及颜色
        [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
        [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor cyanColor],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
        //设置渲染方式(始终显示原图片)
        viewController.tabBarItem.image = [[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}

- (void)configueSeparatorLine
{
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[UIColor lightGrayColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setShadowImage:img];
    [self.tabBar setBackgroundImage:[[UIImage alloc] init]];
}


@end
