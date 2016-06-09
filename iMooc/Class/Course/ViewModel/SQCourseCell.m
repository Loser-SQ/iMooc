//
//  SQCourseCell.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQCourseCell.h"

#import "SQCourseModel.h"

#import "UIImageView+WebCache.h"

@interface SQCourseCell ()
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *max;


@end

@implementation SQCourseCell

- (void)setModel:(SQCourseModel *)model
{
    _model = model;
    
    [self.pic sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    
    self.name.text = model.name;
    
    self.number.text = [NSString stringWithFormat:@"%ld",(long)model.numbers];
    
    if (model.finished)
    {
        self.max.text = @"更新完成";
        
        self.max.textColor = [UIColor grayColor];
    }
    else
    {
        self.max.text = [NSString stringWithFormat:@"更新至%ld-%ld",(long)model.max_chapter_seq,(long)model.max_media_seq];
        
        self.max.textColor = [UIColor grayColor];
    }
    
    self.ID = [NSString stringWithFormat:@"%ld",(long)model.ID];
}

@end
