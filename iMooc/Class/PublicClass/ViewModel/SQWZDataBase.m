//
//  SQWZDataBase.m
//  iMooc
//
//  Created by qianfeng on 16/5/26.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQWZDataBase.h"

#import "SQImageFindModel.h"

@implementation SQWZDataBase

+ (instancetype)sharedDataBase {
    static SQWZDataBase *_db = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 获取数据库存储的路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/WZ.db"];
        // path: 数据库存放的路径
        _db = [[SQWZDataBase alloc] initWithPath:path];
        // 打开数据库
        [_db open];
        // 建表
        [_db createTable];
    });
    
    return _db;
}
// 建表
- (void)createTable {
    NSString *sql = @"create table if not exists SQKC (id varchar(16) primary key, title varchar(32), type varchar(16), view varchar(16), desc varchar(32), img varchar(32))";
    
    // 执行建表
    [self executeUpdate:sql];
}

#pragma mark ########### 数据操作 ##########
- (void)addRecord:(SQImageFindModel *)model {
    
    // 1. SQL
    NSString *sql = @"insert into SQKC (id, title, type, view, desc, img) values (?, ?, ?, ?, ?, ?)";
    
    // 2. 执行
    [self executeUpdate:sql,@(model.ID) , model.title, model.type, @(model.view), model.desc, model.img];
}

- (void)deleteRecord:(NSInteger)ID {
    // 1. SQL
    NSString *sql = @"delete from SQKC where id = ?";
    // 2. 执行
    [self executeUpdate:sql, @(ID)];
}

- (NSArray *)findAll {
    // 1. SQL
    NSString *sql = @"select * from SQKC";
    // 2. 执行查询
    FMResultSet *result = [self executeQuery:sql];
    // 3. 返回数组
    return [SQImageFindModel modelsFromFMResultSet:result];
}

- (BOOL)KCIsExists:(NSInteger)ID {
    // 1. 按照主键查询
    NSString *sql = @"select * from SQKC where id = ?";
    // 2. 查询
    FMResultSet *set = [self executeQuery:sql, @(ID)];
    // 3. 返回结果
    return set.next;
}


@end
