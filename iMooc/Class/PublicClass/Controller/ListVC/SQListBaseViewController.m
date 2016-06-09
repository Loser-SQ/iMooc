//
//  SQListBaseViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQListBaseViewController.h"

#import "SQPlayViewController.h"

#import "SQCourseCell.h"

#import "SQKCDataBase.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SQListBaseViewController ()

@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic,copy)NSString *url;

@property (nonatomic,copy)NSMutableDictionary *dict;

@end

@implementation SQListBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.page = 1;
    
    [self initTableView];
    
    [self addRefresh];
}

#pragma mark --------- 刷新集成 -----------------
- (void)addRefresh
{
    // 集成下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        if (self.dataSource.count == 0)
        {
           [self.tableView.mj_header endRefreshing];
        }
        else
        {
            self.page = 1;
            
            [self loadDataWithUrl:_url dict:_dict];
        }
    }];
    
    // 添加刷新头部
    self.tableView.mj_header = header;
    
    // 集成上拉加载
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.page += 1;
        
        // 太坑!艹!
        NSMutableDictionary *dict1 = [NSMutableDictionary dictionaryWithDictionary:self.dict];
        
        [dict1 setObject:@(self.page) forKey:@"page"];
        
        [self loadDataWithUrl:_url dict:dict1];
    }];
    
    // 添加刷新尾部
    self.tableView.mj_footer = footer;
}

/** tableView的实例化 */
- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;

    self.tableView.dataSource = self;
    
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
}

-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        CGPoint point = [gesture locationInView:self.tableView];
        
        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:point];
        
        if(indexPath == nil) return ;
        
        NSLog(@"%@",self.dataSource[indexPath.row]);
        
        SQCourseModel *model = [[SQCourseModel alloc] init];
        
        model = self.dataSource[indexPath.row];
        
        if ([[SQKCDataBase sharedDataBase] KCIsExists:model.ID])
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"该课程已收藏" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"已阅" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else
        {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定收藏该课程?" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"算了" style:UIAlertActionStyleCancel handler:nil];
            
            
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"必须的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[SQKCDataBase sharedDataBase] addRecord:model];
            }];
            
            [alertController addAction:cancelAction];
            
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }
}

- (void)loadDataWithUrl:(NSString *)url dict:(NSMutableDictionary *)dict
{
    self.url = url;
    
    self.dict = dict;
    
    // 开始加载数据前, 先显示加载菊花
    [self showLoadingView];
    
    [SQAFNetWorking POST:url parameters:dict complationHandle:^(id responseObject, NSError *error) {
        
        if (self.tableView.mj_header.isRefreshing)
        {
            if (![responseObject[@"errorDesc"] isEqualToString:@"内容为空"])
            {
                // 先清空数组中原来的内容
                [self.dataSource removeAllObjects];
            }
        }
        
        if (![responseObject[@"errorDesc"] isEqualToString:@"内容为空"])
        {
            // 1. 获取存储所有字典的数组
            NSArray *allData = responseObject[@"data"];
            
            // 2. 如果一个数组中的元素都是字典, 可以用这个方法, 快速的把字典转成模型, 并存到一个数组中返回
            NSArray *models = [SQCourseModel arrayOfModelsFromDictionaries:allData];
            // 3. 把模型从models中拷一份到dataSource中
            [self.dataSource addObjectsFromArray:models];
            // 4. 刷新表格
            [self.tableView reloadData];
            
            // 隐藏菊花
            [self hideLoadingView];
            
            // 停止刷新
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        }
        else
        {
            // 停止刷新
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
            
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
            
            // 隐藏菊花
            [self hideLoadingView];
        }
        
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 先去复用池找cell
    SQCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SQCourseCell"];
    // 2. 如果找不到, 去加载一个XIB的cell(千万不要alloc)
    if (cell == nil) {
        // 需要加载的XIB文件的名字
        cell = [[NSBundle mainBundle] loadNibNamed:@"SQCourseCell" owner:self options:nil].firstObject;
    }
    
    // 1. 获取这一个cell上要展示的数据
    self.model = self.dataSource[indexPath.row];
    // 2. 告诉cell需要展示什么数据
    cell.model = self.model;
    
    UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    longPressGr.minimumPressDuration = 1.0;
    [cell addGestureRecognizer:longPressGr];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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

- (NSMutableArray *)dataSource
{
    if (!_dataSource)
    {
        _dataSource = [NSMutableArray new];
    }
    
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}


@end
