//
//  Tool.m
//  ChangeRootViewControllerDemo
//
//  Created by 邱豪 on 2018/12/11.
//  Copyright © 2018 sweet wine. All rights reserved.
//

#import "Tool.h"

@implementation Tool

// !!!: 将试图绘制成图片
+ (UIImage *)paintingPictureWithView:(UIView *)view
{
    UIImage* image = nil;
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    [view.layer renderInContext: UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (image != nil) {
//        // 保存图片
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        return image;
    }
    return nil;
}

@end
