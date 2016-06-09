//
//  SQPlayDetailCell.m
//  iMooc
//
//  Created by qianfeng on 16/5/25.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQPlayDetailCell.h"

#import "SQDataModel.h"


@interface SQPlayDetailCell()
@property (weak, nonatomic) IBOutlet UILabel *text;

@end

@implementation SQPlayDetailCell

- (void)setModel:(SQPlayDetailModel *)model
{
    _model = model;
    
    self.text.text = [NSString stringWithFormat:@"· %@-%@ %@",model.chapter_seq, model.media_seq, model.name];
    
    self.media_url = model.media_url;
    
    self.name = model.name;
}

@end
