//
//  SQMainTBViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQMainTBViewController.h"

#import "UITabBarController+SQ_AddChildController.h"

@interface SQMainTBViewController ()

@end

@implementation SQMainTBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createtabBarItem];
}

#pragma mark ------- TabBarController绑定 -------
- (void)createtabBarItem
{
    //    NSArray *array = @[
    //                       @[@"课程", @"下载", @"发现", @"我的"],
    //                       @[@"SQ_CTableViewController", @"SQ_DTableViewController",
    //                         @"SQ_FTableViewController", @"SQ_MViewController"],
    //                       @[@"rootTabBar_0", @"rootTabBar_1",
    //                         @"rootTabBar_2", @"rootTabBar_3"],
    //                       @[@"rootTabBar_0HL", @"rootTabBar_1HL",
    //                         @"rootTabBar_2HL", @"rootTabBar_3HL"]
    //                       ];
    
    NSArray *array = @[
                       @[@"课程", @"发现", @"我的"],
                       
                       @[@"SQCourseViewController",
                         @"SQFindViewController",
                         @"SQMineViewController"],
                       
                       @[@"rootTabBar_0",
                         @"rootTabBar_2",
                         @"rootTabBar_3"],
                       
                       @[@"rootTabBar_0HL",
                         @"rootTabBar_2HL",
                         @"rootTabBar_3HL"]
                       ];
    
    for (NSInteger i = 0; i < array.count - 1; i++)
    {
        [self addChildTabBarController:array[0][i] controller:array[1][i] unSelectedImage:array[2][i] selectedImage:array[3][i]];
    }
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
