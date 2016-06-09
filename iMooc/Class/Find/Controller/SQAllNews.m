//
//  SQAllNews.m
//  iMooc
//
//  Created by qianfeng on 16/5/25.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQAllNews.h"

#import "SQImageFindModel.h"

#import "SQImageNewsCell.h"

#import "SQNewsCell.h"

#import "SQFactory.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SQAllNews ()

@end

@implementation SQAllNews

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDataWithUrl:@"http://www.imooc.com/api3/articlelist" dict:[SQFactory DictionaryWithPage:self.page token:@"aec1e1fe6da2e8a4ba9d7b725d851f57" typeid:0]];
    
}

@end
