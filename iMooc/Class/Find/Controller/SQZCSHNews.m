//
//  SQZCSHNews.m
//  iMooc
//
//  Created by qianfeng on 16/5/25.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQZCSHNews.h"

@interface SQZCSHNews ()

@end

@implementation SQZCSHNews

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDataWithUrl:@"http://www.imooc.com/api3/articlelist" dict:[SQFactory DictionaryWithPage:self.page token:@"aec1e1fe6da2e8a4ba9d7b725d851f57" typeid:107]];
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
