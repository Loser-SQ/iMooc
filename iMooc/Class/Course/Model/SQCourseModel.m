//
//  SQCourseModel.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQCourseModel.h"

#import "FMResultSet.h"

@implementation SQCourseModel

+ (JSONKeyMapper *)keyMapper {
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"ID"}];
}

+ (NSArray *)modelsFromFMResultSet:(FMResultSet *)result {
    // 1. 可变数组
    NSMutableArray *allModels = [NSMutableArray array];
    
    // 2. 将一条条的数据转成模型, 存入数组
    while (result.next) {
        SQCourseModel *model = [[SQCourseModel alloc] init];
        
        model.ID = [[result objectForColumnName:@"id"] integerValue];
        
        model.name = [result objectForColumnName:@"name"];
        
        model.max_media_seq = [[result objectForColumnName:@"max_media_seq"] integerValue];
        
        model.max_chapter_seq = [[result objectForColumnName:@"max_chapter_seq"] integerValue];
        
        model.numbers = [[result objectForColumnName:@"numbers"] integerValue];
        
        model.finished = [[result objectForColumnName:@"finished"] integerValue];
        
        model.pic = [result objectForColumnName:@"pic"];
        
        model.desc = [result objectForColumnName:@"desc"];
        
        [allModels addObject:model];
    }
    
    
    return allModels;
}

@end
