//
//  SQAllClassifyModel.h
//  iMooc
//
//  Created by qianfeng on 16/5/20.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQBaseModel.h"

@class SQTbaleModel;
// 空协议!!!
// 用来指派数组中元素的类型
@protocol SQTbaleModel
@end

@interface SQAllClassifyModel : SQBaseModel

@property (nonatomic,assign)NSInteger ID;

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *pic;

@property (nonatomic,assign)NSInteger numbers;

@property (nonatomic,strong)NSArray <SQTbaleModel>*categories;

@end


@class SQClassifyModel;
// 空协议!!!
// 用来指派数组中元素的类型
@protocol SQClassifyModel
@end

// 再声明一个类
@interface SQTbaleModel : SQBaseModel

@property (nonatomic,assign)NSInteger ID;

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *marking;

@property (nonatomic,strong)NSArray <SQClassifyModel>*skills;

@end

 //再声明一个类
@interface SQClassifyModel : SQBaseModel

@property (nonatomic,assign)NSInteger ID;

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *pic;

@property (nonatomic,assign)NSInteger numbers;

@end
