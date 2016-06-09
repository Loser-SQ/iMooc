//
//  SQCourseCell.h
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQCourseModel;

@interface SQCourseCell : UITableViewCell

@property (nonatomic,strong)SQCourseModel *model;

@property (nonatomic,strong)NSString *ID;

@end
