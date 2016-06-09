//
//  SQImageFindModel.h
//  iMooc
//
//  Created by qianfeng on 16/5/25.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQBaseModel.h"

@class FMResultSet;

@interface SQImageFindModel : SQBaseModel

@property (nonatomic, assign) NSInteger push;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger type_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger view;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) NSInteger comment;

@property (nonatomic, copy) NSString *desc;

+ (NSArray *)modelsFromFMResultSet:(FMResultSet *)result;

@end
