//
//  SQListBaseViewController.h
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQBaseViewController.h"

#import "SQAFNetWorking.h"

#import "Masonry.h"

#import "SQFactory.h"

#import "SQCourseModel.h"

#import "SQCourseCell.h"

#import "MJRefresh.h"

@interface SQListBaseViewController : SQBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,assign)int page;

@property (nonatomic,strong)SQCourseModel *model;

- (void)loadDataWithUrl:(NSString *)url dict:(NSDictionary *)dict;

- (void)addRefresh;

- (void)initTableView;

@end
