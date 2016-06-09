//
//  SQImageNewsCell.h
//  iMooc
//
//  Created by qianfeng on 16/5/25.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQImageFindModel;

@interface SQImageNewsCell : UITableViewCell

@property (nonatomic,strong)SQImageFindModel *model;

@property (nonatomic,assign)NSInteger ID;

@end
