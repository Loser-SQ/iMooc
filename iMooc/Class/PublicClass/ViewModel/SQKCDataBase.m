//
//  SQKCDataBase.m
//  iMooc
//
//  Created by qianfeng on 16/5/26.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQKCDataBase.h"

#import "SQCourseModel.h"

@implementation SQKCDataBase

+ (instancetype)sharedDataBase {
    static SQKCDataBase *_db = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 获取数据库存储的路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/KC.db"];
        // path: 数据库存放的路径
        _db = [[SQKCDataBase alloc] initWithPath:path];
        // 打开数据库
        [_db open];
        // 建表
        [_db createTable];
    });
    
    return _db;
}
// 建表
- (void)createTable {
    NSString *sql = @"create table if not exists SQKC (id varchar(16) primary key, name varchar(32), max_media_seq varchar(16), pic varchar(32), numbers varchar(16), finished varchar(16), desc varchar(16), max_chapter_seq varchar(16))";
    
    // 执行建表
    [self executeUpdate:sql];
}

#pragma mark ########### 数据操作 ##########
- (void)addRecord:(SQCourseModel *)model {
    // 1. SQL
    NSString *sql = @"insert into SQKC (id, name, max_media_seq, pic, numbers, finished, desc, max_chapter_seq) values (?, ?, ?, ?, ?, ?, ?, ?)";
    
    // 2. 执行
    [self executeUpdate:sql,@(model.ID) , model.name, @(model.max_media_seq), model.pic, @(model.numbers), @(model.finished), model.desc, @(model.max_chapter_seq)];
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
    return [SQCourseModel modelsFromFMResultSet:result];
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
