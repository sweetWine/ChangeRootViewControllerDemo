   在项目开发过程中，经常会遇到需要更换window根控制器的情况，这里把常用的方式以及可能遇到的情况总结了一下。

```
((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController = rootViewController;
```
   这是最根本的方式，大部分开发者都会直接选择这种方式进行更换根控制器。但是这样的直接转换给人一种很生硬的感觉，所以很多人会选择添加一些动画来使更换变得友好一点。例如：
```
RootTabBarController *rootController = 
[[RootTabBarController alloc] init];
[UIView transitionFromView:currentRootViewController.view
                        toView:rootController.view
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    completion:^(BOOL finished) {
        [AppDelegate shareInstance].window.rootViewController = rootController;
    }];
```
   这样添加是没有问题的，而且在更换控制器时产生了一个过渡动画，看着更舒服一点，但是这里有一个小坑，一些开发者在某个页面中想要更换控制器时喜欢使用self.view来进行视图切换，这个时候就很可能出现问题
>如果你的根控制器只是一个UIViewController,那么使用self.view来进行视图切换是没有问题的，但是如果是一个UINavigationController或者UITabBarController时，在子控制器中使用self.view来进行视图切换，可能会导致动画结束之后出现白屏的现象！

   这是因为使用上述动画切换视图时，是在同一个父视图上进行切换的，如果在UINavigationController或者UITabBarController的自控制器中使用self.view，它的父视图将不会是window，而是UIViewControllerWrapperView，在根控制器切换过之后，之前的控制器销毁，会连带着UIViewControllerWrapperView一块销毁，这样就导致了更换完之后出现白屏，解决方式很简单，一种是通过上面给出的那中方式，直接取当前根控制器的view来进行切换，或者是创建一个中间视图，以中间视图来进行视图切换，动画完成之后再更换根控制器。例如：
```
    UIImageView *transitionView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    // 将loginViewController.view绘制成图片
    transitionView.image = [Tool paintingPictureWithView:loginViewController.view];
    [UIView transitionFromView:self.view toView:transitionView duration:1.0f options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        [transitionView removeFromSuperview];
        [AppDelegate shareInstance].window.rootViewController = loginViewController;
    }];
```
[戳这里看demo](https://github.com/sweetWine/ChangeRootViewControllerDemo.git)