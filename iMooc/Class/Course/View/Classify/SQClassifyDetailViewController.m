//
//  SQClassifyDetailViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/23.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQClassifyDetailViewController.h"

#import "SQMainNavViewController.h"

#import "UIImage+SQColorOfPoint.h"

#import "UIImageView+WebCache.h"

#import "Masonry.h"

#import "WMPageController.h"

#import "SQAllFilmViewController.h"

#import "SQFirstFilmViewController.h"

#import "SQSecFilmViewController.h"

#import "SQThirdFilmViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SQClassifyDetailViewController ()

@end

@implementation SQClassifyDetailViewController


+(instancetype)create
{
    SQClassifyDetailViewController *DetailVC = [[SQClassifyDetailViewController alloc] initWithViewControllerClasses:[self ViewControllerClasses] andTheirTitles:@[@"全部",@"初级",@"中级",@"高级"]];
    
    //        WMPageController的设置
    DetailVC.menuViewStyle = WMMenuViewStyleLine;
    // 设置背景色
    DetailVC.menuBGColor = [UIColor whiteColor];
    // 选中时颜色
    DetailVC.titleColorSelected = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
    // 设置每个item的宽
    DetailVC.itemsWidths = @[@(36),@(36),@(36),@(36)];
    DetailVC.progressHeight = 3.5;
    DetailVC.progressColor = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
    DetailVC.menuHeight = 45;
    DetailVC.viewFrame = CGRectMake(0, 84, SCREEN_WIDTH, SCREEN_HEIGHT - 148);
    
    return DetailVC;
}

// 存响应的控制器
+ (NSArray *)ViewControllerClasses {
    return @[[SQAllFilmViewController class],[SQFirstFilmViewController class], [SQSecFilmViewController class], [SQThirdFilmViewController class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setTitleImage];
    
//    [self.navigationItem.backBarButtonItem setTitle:@""];
//    
//    [self.navigationItem setHidesBackButton:YES];
//    
//    self.navigationController.transView.userInteractionEnabled = NO;
}

- (void)setTitleImage
{
    UIImageView *image = [[UIImageView alloc] init];
    
    [image sd_setImageWithURL:[NSURL URLWithString:self.pic]];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, 148)];
    
    titleView.backgroundColor = [image.image mostColor];
    
    [self.view addSubview:titleView];
    
    UILabel *titlelabel = [UILabel new];
    
    titlelabel.text = self.name;
    
    titlelabel.font = [UIFont boldSystemFontOfSize:19];
    
    titlelabel.textAlignment = NSTextAlignmentCenter;
    
    titlelabel.textColor = [UIColor whiteColor];
    
    titlelabel.backgroundColor = [image.image mostColor];
    
    [titleView addSubview:titlelabel];
    
    [titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(titleView).equalTo(@(-20));
        
        make.left.equalTo(titleView);
        
        make.width.equalTo(@(SCREEN_WIDTH));
        
        make.height.equalTo(@(20));
    }];
    
    [titleView addSubview:image];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleView).equalTo(@(20));
        
        make.height.equalTo(@(88));
        
        make.width.equalTo(@(88));
        
        make.centerX.equalTo(titleView.mas_centerX);
        
    }];
    
//    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectZero];
//    
//    backImage.image = [UIImage imageNamed:@"clear"];
//    
//    backImage.userInteractionEnabled = YES;
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
//    
//    [backImage addGestureRecognizer:tap];
//    
//    [titleView addSubview:backImage];
//    
//    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(titleView).equalTo(@(27));
//        
//        make.height.equalTo(@(30));
//        
//        make.width.equalTo(@(30));
//        
//        make.centerY.equalTo(titleView.mas_top).equalTo(@(42));
//        
//        make.left.equalTo(@(15));
//    }];
}

#pragma mark ------- 返回上级 -------
- (void)back
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationItem setHidesBackButton:YES];
}

@end
