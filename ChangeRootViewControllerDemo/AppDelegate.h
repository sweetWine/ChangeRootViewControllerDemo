//
//  AppDelegate.h
//  ChangeRootViewControllerDemo
//
//  Created by 邱豪 on 2018/12/11.
//  Copyright © 2018 sweet wine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong)RootTabBarController *rootViewController;

+ (instancetype)shareInstance;

@end

