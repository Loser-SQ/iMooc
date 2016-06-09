//
//  SQMainNavViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQMainNavViewController.h"

@interface SQMainNavViewController ()

@end

@implementation SQMainNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 获取透明图片
    UIImage *image = [self getTransImageFromSize:CGSizeMake(1, 1)];
    
    // 2. 设置为导航的背景图片
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    // 3. 创建自定义的透明的view
    self.transView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.navigationBar.bounds.size.width, self.navigationBar.bounds.size.height + 20)];
    
    // 4. 添加到导航栏上
    [self.navigationBar insertSubview:self.transView atIndex:0];
    
    // 5. 隐藏底部的线
    self.navigationBar.shadowImage = [UIImage new];
    
    // 6. 添加tag值
    self.transView.tag = 1000;
    
    self.transView.userInteractionEnabled = NO;
}

/**
 *  用代码创建一个透明的图片
 */
- (UIImage *)getTransImageFromSize:(CGSize)size
{
    // 1. 开始绘制图片
    /**
     *  参数1: 大小
     *  参数2: 和透明性管的, no, 透明, yes就是不透明
     */
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // 获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 3. 结束绘制图片
    UIGraphicsEndImageContext();
    
    return image;
}

@end


@implementation UINavigationController (transparant)

- (UIView *)transView
{
    // 判断是不是自定义的导航
    if ([self isKindOfClass:[SQMainNavViewController class]])
    {
        return [self.navigationBar viewWithTag:1000];
    }
    return nil;
}

@end

