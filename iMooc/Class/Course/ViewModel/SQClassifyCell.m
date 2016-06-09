//
//  SQClassifyCell.m
//  iMooc
//
//  Created by qianfeng on 16/5/21.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQClassifyCell.h"

#import "UIImageView+WebCache.h"

#import "SQAllClassifyModel.h"

@interface SQClassifyCell()

@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *name;


@end

@implementation SQClassifyCell

- (void)setModel:(SQClassifyModel *)model
{
    _model = model;
    
    [self.pic sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    
    NSString *origStr = [NSString stringWithFormat:@"%@ %ld",model.name,(long)model.numbers];
    
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:origStr];
    [str addAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor],
                         NSFontAttributeName: [UIFont systemFontOfSize:10]} range:[origStr rangeOfString:[NSString stringWithFormat:@"%ld",(long)model.numbers]]];
    
    self.name.attributedText = str;
    
    
    
}

@end
