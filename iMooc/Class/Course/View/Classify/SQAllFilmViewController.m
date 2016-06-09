//
//  SQAllFilmViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/23.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQAllFilmViewController.h"

#import "SQClassifyDetailViewController.h"

#import "SQFactory.h"

@interface SQAllFilmViewController ()

@end

@implementation SQAllFilmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SQClassifyDetailViewController *detail = (SQClassifyDetailViewController *)self.parentViewController;
    
    [self loadDataWithUrl:@"http://www.imooc.com/api3/courselist_ver2" dict:[SQFactory DictionaryWithAll_type:1 cat_type:(int)detail.ID easy_type:0 page:1 sort_type:0 token:@"7f75e24cb1f7e5c358f03a7b40a60976"]];
}


@end
