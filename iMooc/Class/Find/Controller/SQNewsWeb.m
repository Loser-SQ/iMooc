//
//  SQNewsWeb.m
//  iMooc
//
//  Created by qianfeng on 16/5/26.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQNewsWeb.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SQNewsWeb () <UIWebViewDelegate>

@end

@implementation SQNewsWeb

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"详情";
    
    [self createWebView];
}

- (void)createWebView
{
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 20, SCREEN_HEIGHT + 49)];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.imooc.com/article/%ld",(long)self.ID]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [web loadRequest:request];
    
    web.delegate = self;
    
    [(UIScrollView *)[[web subviews] objectAtIndex:0] setBounces:NO];
    
    [self.view addSubview:web];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('comment-wrap')[0].style.display='NONE'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('more-btn look-more')[0].style.display='NONE'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('js-toapp').style.display='NONE'"];
    
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
