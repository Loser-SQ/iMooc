//
//  SQCourseModel.h
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQBaseModel.h"

@class FMResultSet;

@interface SQCourseModel : SQBaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger max_media_seq;

@property (nonatomic, assign) NSInteger max_chapter_seq;

@property (nonatomic, assign) NSInteger numbers;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger finished;

@property (nonatomic, copy) NSString *name;

+ (NSArray *)modelsFromFMResultSet:(FMResultSet *)result;

@end
