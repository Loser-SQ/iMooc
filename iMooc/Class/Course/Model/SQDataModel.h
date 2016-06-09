//
//  SQDataModel.h
//  iMooc
//
//  Created by qianfeng on 16/5/25.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQBaseModel.h"

//@class SQPlayModel;
//// 空协议!!!
//// 用来指派数组中元素的类型
//@protocol SQPlayModel
//
//@end

@class SQPlayDetailModel;
// 空协议!!!
// 用来指派数组中元素的类型
@protocol SQPlayDetailModel

@end

@interface SQDataModel : SQBaseModel

//@property (nonatomic,strong)NSDictionary <SQPlayModel>*chapter;

@property (nonatomic,strong)NSDictionary *chapter;

@property (nonatomic,strong)NSArray <SQPlayDetailModel>*media;

@end

@interface SQPlayModel : SQBaseModel

@property (nonatomic,strong)NSString *name;

@property (nonatomic,strong)NSNumber *suq;

@end


@interface SQPlayDetailModel : SQBaseModel

@property (nonatomic,strong)NSString *name;

@property (nonatomic,strong)NSNumber *chapter_seq;

@property (nonatomic,strong)NSNumber *media_seq;

@property (nonatomic,strong)NSString *media_url;

@end


