//
//  SQCourseViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQCourseViewController.h"

#import "SQClaaifyViewController.h"

#import "SQSearchViewController.h"

#import "SQMainNavViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SQCourseViewController ()

@property (nonatomic,strong)UIView *bgView;

@end

@implementation SQCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNavigationUI];
    
    [self loadDataWithUrl:@"http://www.imooc.com/api3/courselist_ver2" dict:[SQFactory DictionaryWithPage:self.page token:@"7f75e24cb1f7e5c358f03a7b40a60976" cat_type:0 easy_type:0]];
    
    // 设置透明view的透明色
    self.navigationController.transView.backgroundColor = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
}

- (void)createNavigationUI
{
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    
    self.bgView.backgroundColor = [UIColor clearColor];

    self.navigationItem.titleView = self.bgView;
    
    // 分类
    UIButton *classify = [[UIButton alloc] initWithFrame:CGRectZero];
    
    [classify setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    
    [classify addTarget:self action:@selector(classify) forControlEvents:UIControlEventTouchUpInside];
    
    [self.bgView addSubview:classify];
    
    // 定义约束
    [classify mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        
        make.top.equalTo(@(7));
        
        make.width.equalTo(@(30));
        
        make.height.equalTo(@(30)); // 高度
    }];
    
    // 搜索
    UIButton *search = [[UIButton alloc] initWithFrame:CGRectZero];
    
    [search setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    
    [search addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    
    [self.bgView addSubview:search];
    
    // 定义约束
    [search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(0));
        
        make.top.equalTo(@(7));
        
        make.width.equalTo(@(30));
        
        make.height.equalTo(@(30)); // 高度
    }];
    
    // 标题
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    
    label.text= @"课程";
    
    label.textColor = [UIColor whiteColor];
    
    label.font = [UIFont boldSystemFontOfSize:18];
    
    label.textAlignment = NSTextAlignmentLeft;
    
    label.center = self.bgView.center;
    
    [self.bgView addSubview:label];
}

- (void)classify
{
    SQClaaifyViewController *classify = [[SQClaaifyViewController alloc] init];
    
    classify.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:classify animated:YES];
}

- (void)search
{
    SQSearchViewController *search = [[SQSearchViewController alloc] init];
    
    search.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:search animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
