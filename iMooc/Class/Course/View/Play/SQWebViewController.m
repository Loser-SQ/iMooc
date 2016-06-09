//
//  SQWebViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/25.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQWebViewController.h"

#import "Masonry.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SQWebViewController ()

@end

@implementation SQWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
    
    [self createUI];
    
    [self createWebView];
}

- (void)createUI
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44)];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 7, 30, 30)];
    
    image.image = [UIImage imageNamed:@"clear"];
    
    image.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    
    [image addGestureRecognizer:tap];
    
    [view addSubview:image];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.text = self.lab;
    
    label.textColor = [UIColor whiteColor];
    
    label.font = [UIFont systemFontOfSize:17];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view.mas_centerX);
        
        make.centerY.equalTo(view.mas_centerY);
        
        make.width.equalTo(@(200));
        
        make.height.equalTo(@(30));
        
    }];
    
    [self.view addSubview:view];
}

- (void)createWebView
{
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    
    NSURL *url = [NSURL URLWithString:self.media_url];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [web loadRequest:request];
    
    [self.view addSubview:web];
}

- (void)back
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
