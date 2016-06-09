//
//  SQMineViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQMineViewController.h"

#import "SQMainNavViewController.h"

#import "SQKCViewController.h"

#import "SQWZViewController.h"

#import "SQMusicViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SQMineViewController ()

@end

@implementation SQMineViewController

+(instancetype)create
{
    SQMineViewController *mine = [[SQMineViewController alloc] initWithViewControllerClasses:[self ViewControllerClasses] andTheirTitles:@[@"收藏的课程",@"收藏的文章"]];
    
    //        WMPageController的设置
    mine.menuViewStyle = WMMenuViewStyleLine;
    // 设置背景色
    mine.menuBGColor = [UIColor whiteColor];
    // 选中时颜色
    mine.titleColorSelected = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
    // 设置每个item的宽
    mine.itemsWidths = @[@(90), @(90)];
    mine.progressHeight = 3;
    mine.progressColor = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
    mine.menuHeight = 45;
    mine.viewFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    return mine;
}

// 存响应的控制器
+ (NSArray *)ViewControllerClasses {
    return @[[SQKCViewController class],[SQWZViewController class]];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置透明view的透明色
    self.navigationController.transView.backgroundColor = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
    
}

@end