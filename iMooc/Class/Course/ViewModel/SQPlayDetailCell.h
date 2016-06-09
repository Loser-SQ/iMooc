//
//  SQPlayDetailCell.h
//  iMooc
//
//  Created by qianfeng on 16/5/25.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQPlayDetailModel;

@interface SQPlayDetailCell : UITableViewCell

@property (nonatomic,strong)SQPlayDetailModel *model;

@property (nonatomic,strong)NSString *media_url;

@property (nonatomic,strong)NSString *name;

@end
