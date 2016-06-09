//
//  SQNewsCell.m
//  iMooc
//
//  Created by qianfeng on 16/5/25.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQNewsCell.h"

#import "SQImageFindModel.h"

@interface SQNewsCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *detail;

@end

@implementation SQNewsCell

- (void)setModel:(SQImageFindModel *)model
{
    _model = model;
    
    self.title.text = model.title;
    
    self.type.text = model.type;
    
    self.number.text = [NSString stringWithFormat:@"%ld阅读", (long)model.view];
    
    self.detail.text = model.desc;
    
    self.ID = model.ID;
}


@end
