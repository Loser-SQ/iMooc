//
//  UITabBarController+SQ_AddChildController.m
//  iMooc
//
//  Created by qianfeng on 16/5/17.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "UITabBarController+SQ_AddChildController.h"

#import "SQFindViewController.h"

#import "SQMineViewController.h"

#import "SQMainNavViewController.h"

#import "UIImage+SQ_OriginalIamge.h"

@implementation UITabBarController (SQ_AddChildController)

/**
 *  添加子控制器
 *
 *  @param controllerName      控制器名称
 *  @param unSelectedImageName 未选中时图片名字
 *  @param selectdImageName    选中图片名字
 */
- (void) addChildTabBarController:(NSString *)title controller:(NSString *)controllerName unSelectedImage:(NSString *)unSelectedImageName selectedImage:(NSString *)selectdImageName
{
    UITabBarItem *tempItem = [[UITabBarItem alloc] initWithTitle:title
                                                           image:[UIImage imageNamed:unSelectedImageName].originalImage
                                                   selectedImage:[UIImage imageNamed:selectdImageName].originalImage];
    
    if ([controllerName isEqualToString:@"SQFindViewController"])
    {
        SQFindViewController *controller = [SQFindViewController create];
        
        controller.tabBarItem = tempItem;
        
        controller.title = title;
        
        SQMainNavViewController *nav = [[SQMainNavViewController alloc] initWithRootViewController:controller];
        
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.95f green:0.10f blue:0.00f alpha:1.00f]];
        
        [self addChildViewController:nav];
    }
    else if ([controllerName isEqualToString:@"SQMineViewController"])
    {
        SQMineViewController *controller = [SQMineViewController create];
        
        controller.tabBarItem = tempItem;
        
        controller.title = title;
        
        SQMainNavViewController *nav = [[SQMainNavViewController alloc] initWithRootViewController:controller];
        
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.95f green:0.10f blue:0.00f alpha:1.00f]];
        
        [self addChildViewController:nav];
    }
    else
    {
        Class controllerClass = NSClassFromString(controllerName);
        
        UIViewController *controller = [[controllerClass alloc]init];
        
        controller.tabBarItem = tempItem;
        
        controller.title = title;
        
        SQMainNavViewController *nav = [[SQMainNavViewController alloc] initWithRootViewController:controller];
        
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.95f green:0.10f blue:0.00f alpha:1.00f]];
        
        [self addChildViewController:nav];
    }
    
    
}

@end
