//
//  SQKCViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/27.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQKCViewController.h"

#import "SQKCDataBase.h"

#import "SQCourseCell.h"

#import "SQCourseModel.h"

#import "SQPlayViewController.h"

@interface SQKCViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation SQKCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self createTableView];
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

- (void)loadData
{
    [self.dataSource addObjectsFromArray:[[SQKCDataBase sharedDataBase] findAll]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1. 先去复用池找cell
    SQCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SQCourseCell"];
    // 2. 如果找不到, 去加载一个XIB的cell(千万不要alloc)
    if (cell == nil) {
        // 需要加载的XIB文件的名字
        cell = [[NSBundle mainBundle] loadNibNamed:@"SQCourseCell" owner:self options:nil].firstObject;
    }
    
    // 1. 获取这一个cell上要展示的数据
    cell.model = self.dataSource[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        CGPoint point = [gesture locationInView:self.tableView];
        
        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:point];
        
        if(indexPath == nil) return ;
        
        SQCourseModel *model = [[SQCourseModel alloc] init];
        
        model = self.dataSource[indexPath.row];
        
        NSLog(@"%@",model);
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定取消关注该课程?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"留下它吧" style:UIAlertActionStyleCancel handler:nil];
        
        
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"残忍删掉" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[SQKCDataBase sharedDataBase] deleteRecord:model.ID];
            
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
    
    SQPlayViewController *play = [[SQPlayViewController alloc] init];
    
    SQCourseCell *tempCell = [tableView cellForRowAtIndexPath:indexPath];
    
    play.ID = [tempCell.ID integerValue];
    
    [play setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:play animated:YES];
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
