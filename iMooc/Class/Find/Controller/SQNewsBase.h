//
//  SQNewsBase.h
//  iMooc
//
//  Created by qianfeng on 16/5/26.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQBaseViewController.h"

#import "SQFactory.h"

@interface SQNewsBase : SQBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,assign)int page;

- (void)loadDataWithUrl:(NSString *)url dict:(NSDictionary *)dict;

@end
