//
//  SQSecFilmViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/23.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQSecFilmViewController.h"

#import "SQClassifyDetailViewController.h"

#import "SQFactory.h"

@interface SQSecFilmViewController ()

@end

@implementation SQSecFilmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SQClassifyDetailViewController *detail = (SQClassifyDetailViewController *)self.parentViewController;
    
    [self loadDataWithUrl:@"http://www.imooc.com/api3/courselist_ver2" dict:[SQFactory DictionaryWithAll_type:1 cat_type:(int)detail.ID easy_type:2 page:1 sort_type:0 token:@"7f75e24cb1f7e5c358f03a7b40a60976"]];
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
