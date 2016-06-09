//
//  SQWZViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/27.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQWZViewController.h"

#import "SQWZDataBase.h"

#import "SQImageFindModel.h"

#import "SQNewsCell.h"

#import "SQImageNewsCell.h"

#import "SQNewsWeb.h"

@interface SQWZViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation SQWZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self createTableView];
}

- (void)loadData
{
    [self.dataSource addObjectsFromArray:[[SQWZDataBase sharedDataBase] findAll]];
}

- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    longPressGr.minimumPressDuration = 1.0;
    
    [self.tableView addGestureRecognizer:longPressGr];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SQImageFindModel *model = self.dataSource[indexPath.row];
    if ([model.img isEqualToString:@""])
    {
        // 1. 先去复用池找cell
        SQNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SQNewsCell"];
        // 2. 如果找不到, 去加载一个XIB的cell(千万不要alloc)
        if (cell == nil) {
            // 需要加载的XIB文件的名字
            cell = [[NSBundle mainBundle] loadNibNamed:@"SQNewsCell" owner:self options:nil].firstObject;
        }
        
        // 1. 获取这一个cell上要展示的数据
        SQImageFindModel *model = self.dataSource[indexPath.row];
        // 2. 告诉cell需要展示什么数据
        cell.model = model;
        
        return cell;
    }
    else
    {
        // 1. 先去复用池找cell
        SQImageNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SQImageNewsCell"];
        // 2. 如果找不到, 去加载一个XIB的cell(千万不要alloc)
        if (cell == nil) {
            // 需要加载的XIB文件的名字
            cell = [[NSBundle mainBundle] loadNibNamed:@"SQImageNewsCell" owner:self options:nil].firstObject;
        }
        
        // 1. 获取这一个cell上要展示的数据
        SQImageFindModel *model = self.dataSource[indexPath.row];
        // 2. 告诉cell需要展示什么数据
        cell.model = model;
        
        return cell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        CGPoint point = [gesture locationInView:self.tableView];
        
        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:point];
        
        if(indexPath == nil) return ;
        
        SQImageFindModel *model = [[SQImageFindModel alloc] init];
        
        model = self.dataSource[indexPath.row];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定取消关注该文章?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"留下它吧" style:UIAlertActionStyleCancel handler:nil];
        
        
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"残忍删掉" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[SQWZDataBase sharedDataBase] deleteRecord:model.ID];
            
            [self.dataSource removeObjectAtIndex:indexPath.row];
            
            [self.tableView reloadData];
        }];
        
        [alertController addAction:cancelAction];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取消点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SQNewsCell *tempcell = [tableView cellForRowAtIndexPath:indexPath];
    
    SQNewsWeb *web = [[SQNewsWeb alloc] init];
    
    web.ID = tempcell.ID;
    
    [self.navigationController pushViewController:web animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    //设置Cell的动画效果为3D效果
    //设置x和y的初始值为0.1；
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    //x和y的最终值为1
    [UIView animateWithDuration:1 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

- (NSMutableArray *)dataSource {
    if (_dataSource == nil)
    {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.dataSource removeAllObjects];
    
    [self loadData];
    
    [self.tableView reloadData];
}

@end
