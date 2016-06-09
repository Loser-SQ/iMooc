//
//  SQSearchViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQSearchViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface SQSearchViewController () <UISearchBarDelegate>

@property (nonatomic,strong)UISearchBar *search;

@end

@implementation SQSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self createsearchBar];
}

- (void)createsearchBar
{
    [self.navigationItem setHidesBackButton:YES];
    
    self.search = [[UISearchBar alloc] initWithFrame:CGRectZero];
    
    self.search.placeholder = @"请输入搜索内容";
    
    self.search.delegate = self;
    
    [self.search becomeFirstResponder];
    
    self.navigationItem.titleView = self.search;
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    self.navigationItem.rightBarButtonItem = rightBarButton;

}

- (void)back
{
    [self.search resignFirstResponder];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    [self loadDataWithUrl:@"http://www.imooc.com/api3/courselist_ver2" dict:[SQFactory DictionaryWithPage:self.page token:@"7f75e24cb1f7e5c358f03a7b40a60976" keyword:self.search.text]];
    
    [self.search resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
