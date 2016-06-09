//
//  SQWZDataBase.h
//  iMooc
//
//  Created by qianfeng on 16/5/26.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "FMDatabase.h"

@class SQImageFindModel;
@interface SQWZDataBase : FMDatabase

// 因为我们需要在不同的模块访问同一个数据库, 所以可以将数据库做成一个单例
+ (instancetype)sharedDataBase;


// 封几个方法
// 增
- (void)addRecord:(SQImageFindModel *)model;
// 删
- (void)deleteRecord:(NSInteger)ID;
// 查
- (NSArray *)findAll;
// 判断是否存在
- (BOOL)KCIsExists:(NSInteger)ID;

@end
