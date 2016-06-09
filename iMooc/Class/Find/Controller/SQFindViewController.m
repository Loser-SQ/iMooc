//
//  SQFindViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQFindViewController.h"

#import "SQMainNavViewController.h"

#import "SQAllNews.h"

#import "SQQDKFNews.h"

#import "SQHDKFNews.h"

#import "SQZCSHNews.h"

#import "SQSJNews.h"

#import "SQYDKFNews.h"

#import "SQQTNews.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface SQFindViewController ()

@end

@implementation SQFindViewController

+(instancetype)create
{
    SQFindViewController *find = [[SQFindViewController alloc] initWithViewControllerClasses:[self ViewControllerClasses] andTheirTitles:@[@"全部",@"前端开发",@"后端开发",@"职场生活", @"设计", @"移动开发", @"其他类干货"]];
    
    //        WMPageController的设置
    find.menuViewStyle = WMMenuViewStyleLine;
    // 设置背景色
    find.menuBGColor = [UIColor whiteColor];
    // 选中时颜色
    find.titleColorSelected = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
    // 设置每个item的宽
    find.itemsWidths = @[@(50), @(80), @(80), @(80), @(50), @(80), @(100)];
    find.progressHeight = 3;
    find.progressColor = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
    find.menuHeight = 45;
    find.viewFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    
    return find;
}

// 存响应的控制器
+ (NSArray *)ViewControllerClasses {
    return @[[SQAllNews class],[SQQDKFNews class], [SQHDKFNews class], [SQZCSHNews class] ,[SQSJNews class] ,[SQYDKFNews class] ,[SQQTNews class]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"文章"];
    
    // 设置透明view的透明色
    self.navigationController.transView.backgroundColor = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
