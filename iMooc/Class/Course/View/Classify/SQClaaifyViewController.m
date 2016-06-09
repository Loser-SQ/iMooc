//
//  SQClaaifyViewController.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQClaaifyViewController.h"

#import "SQMainNavViewController.h"

#import "SQFactory.h"

#import "SQAFNetWorking.h"

#import "SQAllClassifyModel.h"

#import "SQClassifyCell.h"

#import "SQHeaderReusableView.h"

#import "SQClassifyDetailViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SQClaaifyViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong)UIView *MBView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic,strong)SQAllClassifyModel *model;

@end

@implementation SQClaaifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self settingNavigationStyle];
    
    [self loadData];
    
    self.navigationController.navigationBar.barStyle = UIBaselineAdjustmentAlignBaselines;
}

- (void)settingNavigationStyle
{
    [self.navigationItem setHidesBackButton:YES];
    
    self.navigationItem.title = @"课程分类";
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    image.image = [UIImage imageNamed:@"clear"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    
    [image addGestureRecognizer:tap];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:image];
}

- (void)loadData
{
    [SQAFNetWorking POST:@"http://www.imooc.com/api3/newcourseskill" parameters:[SQFactory DictionaryWithPage:0 token:@"0a1b7dc4a13ff17db61048ab50bb5509" cat_type:0 easy_type:0] complationHandle:^(id responseObject, NSError *error) {
        
        self.model = [[SQAllClassifyModel alloc]initWithDictionary:responseObject[@"data"] error:nil];
        
        [self createView];
    }];
}

#pragma mark - 创建UICollectionView
- (void)createView
{
    //创建网格布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置最小行间距
    flowLayout.minimumLineSpacing = 5;
    
    //设置最小列间距
    flowLayout.minimumInteritemSpacing = 0;
    
    //设置方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //创建UICollectionView
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    _collectionView.delegate = self;
    
    _collectionView.dataSource = self;
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    // 设置自适应宽高
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    
    //隐藏滚动条
    _collectionView.showsHorizontalScrollIndicator = NO;
    
    //提前注册cell
    [_collectionView registerNib:[UINib nibWithNibName:@"SQClassifyCell" bundle:nil] forCellWithReuseIdentifier:@"mycell"];
    
    //提前注册header
    [_collectionView registerClass:[SQHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    //添加到当前控制器
    [self.view addSubview:_collectionView];
}

//组的数量
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.model.categories.count + 1;
}

//每组网格的数量
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section ==0)
    {
        return 1;
    }
    else
    {
        SQTbaleModel *dict = self.model.categories[section-1];
        
        NSArray *array = dict.skills;
        
        return array.count;
    }
    
}

//设置网格的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH / 2, 40);
}

//创建Item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //直接从缓存池里取，取不到的话自动就帮你创建了
    SQClassifyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
    
    
    if (indexPath.section == 0 )
    {
        SQClassifyModel *m = [[SQClassifyModel alloc] init];
        
        m.name = self.model.name;
        
        m.pic = self.model.pic;
        
        m.numbers = self.model.numbers;
        
        cell.model = m;
        
        return cell;
    }
    
    else
    {
        SQTbaleModel *dict = self.model.categories[indexPath.section-1] ;
            
        NSArray *array = dict.skills;

        cell.model = array[indexPath.item];
            
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SQHeaderReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];

    
    if (indexPath.section == 0)
    {
        return nil;
    }
    
    else
    {
        SQTbaleModel *m = self.model.categories[indexPath.section - 1];
        
        [header refreshTitle:m.name];
        
        return header;
    }
}

//点击的item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SQClassifyDetailViewController *detaiVc = [SQClassifyDetailViewController create];
    
    if (indexPath.section == 0)
    {
        detaiVc.ID = self.model.ID;
        
        detaiVc.pic = self.model.pic;
        
        detaiVc.name = self.model.name;
    }
    else
    {
        SQTbaleModel *tbModel = self.model.categories[indexPath.section - 1];
        
        SQClassifyModel *classModel = tbModel.skills[indexPath.item];
        
        detaiVc.ID = classModel.ID;
        
        detaiVc.pic = classModel.pic;
        
        detaiVc.name = classModel.name;
    }
    
    // 设置透明view的透明色
    self.navigationController.transView.backgroundColor = [UIColor clearColor];
    
    [self.navigationController pushViewController:detaiVc animated:YES];
}


//设置header的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    if (section == 0)
    {
        return CGSizeMake(0, 0);
    }
    else
    {
        return CGSizeMake(0, 30);
    }
}

#pragma mark ------- 懒加载 -------
- (NSMutableArray *)dataSource
{
    if (!_dataSource)
    {
        _dataSource = [NSMutableArray new];
    }
    
    return _dataSource;
}

#pragma mark ------- 返回上级 -------
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    // 设置透明view的透明色
    self.navigationController.transView.backgroundColor = [UIColor colorWithRed:0.78f green:0.36f blue:0.36f alpha:1.00f];
}

@end
