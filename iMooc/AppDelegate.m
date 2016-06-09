//
//  AppDelegate.m
//  iMooc
//
//  Created by qianfeng on 16/5/17.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "AppDelegate.h"

#import "SQMainTBViewController.h"

#import "WXTwitterLikeZoomer.h"

@interface AppDelegate ()

@property (strong, nonatomic) WXTwitterLikeZoomer *zoomer;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    SQMainTBViewController *rootVc = [[SQMainTBViewController alloc]init];
    self.window.rootViewController = rootVc;
    [self.window makeKeyAndVisible];
    
    [self appearance];
    
    [self launchingAnimation];
    
    return YES;
}

- (void)launchingAnimation {
    self.zoomer = [WXTwitterLikeZoomer addToView:self.window withImage:[UIImage imageNamed:@"icon"] backgroundColor:[UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.zoomer startAnimation];
    });
}


#pragma mark ------- 设置全局 -------
- (void)appearance
{
    // 设置navigationBar的颜色
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.95f green:0.10f blue:0.00f alpha:1.00f]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f]];
    
    // 设置navigationBar里title的颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    // 设置颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    // 设置tabbar里title的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f]} forState:UIControlStateSelected];
    
    //设置状态栏样式
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
