//
//  SQPlayViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/24.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQPlayViewController.h"

#import "SQWebViewController.h"

#import "Masonry.h"

#import "SQDataModel.h"

#import "SQPlayDetailCell.h"

#import "KrVideoPlayerController.h"

#import "SQAFNetWorking.h"

#import "SQFactory.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SQPlayViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)NSString *mediaUrl;

@property (nonatomic,strong)KrVideoPlayerController *videoController;

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic,strong)UIToolbar *toolBar;

@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation SQPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setting];
    
    [self loadData];
    
    [self createtableView];
    
    [self createTitle];
    
    [self createToolBar];
    
}

/**
 *  设置界面某些样式
 */
- (void)setting
{
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

/**
 *  创建title
 */
- (void)createTitle
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH*(9.0/16.0) + 20, SCREEN_WIDTH, 40)];
    
    label.text = @"章节";
    
    label.font = [UIFont systemFontOfSize:20];
    
    label.textColor = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:label];
}

/**
 *  创建章节table
 */
- (void)createtableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH*(9.0/16.0)+ 40, SCREEN_WIDTH, SCREEN_HEIGHT - (SCREEN_WIDTH*(9.0/16.0) + 40))];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    // 设置自适应宽高
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
}

- (void)createToolBar
{
    self.navigationController.toolbarHidden = NO;
    
    [self.navigationController.toolbar setBackgroundColor:[UIColor whiteColor]];
    
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake(0, 0, 30, 44);
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame=CGRectMake(0, 0, 30, 44);
    UIButton *btn3=[UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame=CGRectMake(0, 0, 30, 44);
    [btn1 setImage:[UIImage imageNamed:@"btn_back_n"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"toolbar_like_n"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item4=[[UIBarButtonItem alloc]initWithCustomView:btn1];
    
    NSArray *itemsArray=[NSArray arrayWithObjects:space,item4,space, nil];
    self.toolbarItems=itemsArray;
}

- (void)back
{
    [self.videoController dismiss];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createWebView
{
    
}
/**
 *  加载数据
 */
- (void)loadData
{
    [SQAFNetWorking POST:@"http://www.imooc.com/api3/getcpinfo_ver2" parameters:[SQFactory DictionaryWithcid:self.ID token:@"8a23e151eacfe1e9556e71f8eb6b3c9b"] complationHandle:^(id responseObject, NSError *error) {
        NSArray *alldata = responseObject[@"data"];
        
        NSArray *models = [SQDataModel arrayOfModelsFromDictionaries:alldata];
        
        [self.dataSource addObjectsFromArray:models];
        
        [self.tableView reloadData];
        
    }];
    
    
    [SQAFNetWorking POST:@"http://www.imooc.com/api3/getmediainfo_ver2" parameters:[SQFactory DictionaryWithcid:self.ID token:@"9bb4b17710b70a920a1a121cba84c1c2"] complationHandle:^(id responseObject, NSError *error) {
        NSDictionary *dict = responseObject[@"data"];
        
        self.mediaUrl = dict[@"media"][@"media_url"];
        
        [self playVideo];
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SQDataModel *model = self.dataSource[section];
    
    return model.media.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 先去复用池找cell
    SQPlayDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SQPlayDetailCell"];
    // 2. 如果找不到, 去加载一个XIB的cell(千万不要alloc)
    if (cell == nil) {
        // 需要加载的XIB文件的名字
        cell = [[NSBundle mainBundle] loadNibNamed:@"SQPlayDetailCell" owner:self options:nil].firstObject;
    }
    
    // 1. 获取这一个cell上要展示的数据
    SQDataModel *model = self.dataSource[indexPath.section];
    
    SQPlayDetailModel *detailModel = model.media[indexPath.row];
    
    // 2. 告诉cell需要展示什么数据
    cell.model = detailModel;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取消点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SQPlayDetailCell *tempCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([tempCell.media_url hasSuffix:@".mp4"])
    {
        [self.imageView removeFromSuperview];
        
        if (![tempCell.media_url isEqualToString:self.mediaUrl])
        {
            self.mediaUrl = tempCell.media_url;
            
            [self playVideo];
        }
    }
    else
    {
        [self.videoController dismiss];
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        self.imageView.image = [UIImage imageNamed:@"bg_programming_default"];
        
        [self.view addSubview:self.imageView];
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).equalTo(@(0));
            
            make.top.equalTo(self.view).equalTo(@(20));
            
            make.width.equalTo(@(SCREEN_WIDTH));
            
            make.height.equalTo(@(SCREEN_WIDTH*(9.0/16.0)));
        }];
        
        SQWebViewController *web = [[SQWebViewController alloc] init];
        
        web.media_url = tempCell.media_url;
        
        web.lab = tempCell.name;
        
        [self presentViewController:web animated:YES completion:nil];
        
    }
}

//header的标题，分组的时候用到
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    SQDataModel *model = self.dataSource[section];
    
    NSDictionary *dict = model.chapter;
    
    NSNumber *num = dict[@"seq"];
    
    NSString *str = dict[@"name"];
    
    return [NSString stringWithFormat:@"第%@章: %@",num, str];
}

//设置header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

/**
 *  创建播放器
 */
- (void)playVideo{
    NSURL *url = [NSURL URLWithString:self.mediaUrl];
    [self addVideoPlayerWithURL:url];
}

- (void)addVideoPlayerWithURL:(NSURL *)url
{
    if (!self.videoController) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.videoController = [[KrVideoPlayerController alloc] initWithFrame:CGRectMake(0, 20, width, width*(9.0/16.0))];
        __weak typeof(self)weakSelf = self;
        [self.videoController setDimissCompleteBlock:^{
            weakSelf.videoController = nil;
        }];
        [self.videoController setWillBackOrientationPortrait:^{
            [weakSelf toolbarHidden:NO];
        }];
        [self.videoController setWillChangeToFullscreenMode:^{
            [weakSelf toolbarHidden:YES];
        }];
        [self.view addSubview:self.videoController.view];
    }
    self.videoController.contentURL = url;
}

//隐藏navigation tabbar toolBar 电池栏
- (void)toolbarHidden:(BOOL)Bool{
    //    self.navigationController.navigationBar.hidden = Bool;
    //    self.tabBarController.tabBar.hidden = Bool;
    self.navigationController.toolbarHidden = Bool;
    [[UIApplication sharedApplication] setStatusBarHidden:Bool withAnimation:UIStatusBarAnimationFade];
}

/**
 *  页面消失时候销毁播放器
 */
-(void)dealloc
{
    //    NSLog(@"%@ dealloc",[self class]);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self.videoController dismiss];
}

/**
 *  懒加载dataSource
 */
- (NSMutableArray *)dataSource
{
    if (!_dataSource)
    {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.toolbarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.toolbarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

