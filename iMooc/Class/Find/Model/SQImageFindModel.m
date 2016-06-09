//
//  SQImageFindModel.m
//  iMooc
//
//  Created by qianfeng on 16/5/25.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQImageFindModel.h"

#import "FMResultSet.h"

@implementation SQImageFindModel

+ (NSArray *)modelsFromFMResultSet:(FMResultSet *)result {
    // 1. 可变数组
    NSMutableArray *allModels = [NSMutableArray array];
    
    // 2. 将一条条的数据转成模型, 存入数组
    while (result.next) {
        SQImageFindModel *model = [[SQImageFindModel alloc] init];
        
        model.ID = [[result objectForColumnName:@"id"] integerValue];
        
        model.title = [result objectForColumnName:@"title"];
        
        model.view = [[result objectForColumnName:@"view"] integerValue];
        
        model.img = [result objectForColumnName:@"img"];
        
        model.desc = [result objectForColumnName:@"desc"];
        
        model.type = [result objectForColumnName:@"type"];
        
        [allModels addObject:model];
    }
    
    
    return allModels;
}


@end
