//
//  SQBaseViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQBaseViewController.h"

#import "MBProgressHUD.h"

@interface SQBaseViewController ()

// 声明一个加载菊花
@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation SQBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBackgroundColor];
}

// 设置背景颜色
- (void)createBackgroundColor
{
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark -------- 菊花相关 --------
- (void)showLoadingView {
    // 先把HUD提到最上层, 保证不会被其他视图覆盖
    [self.view bringSubviewToFront:self.hud];
    // 再显示
    [self.hud show:YES];
}

- (void)hideLoadingView {
    [self.hud hide:YES];
}


- (MBProgressHUD *)hud {
    if (_hud == nil) {
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        // 加载菊花上显示的文字
        _hud.labelText = @"加载中...";
        
        [self.view addSubview:_hud];
    }
    
    return _hud;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
