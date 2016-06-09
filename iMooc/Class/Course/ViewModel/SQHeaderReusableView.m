//
//  SQHeaderReusableView.m
//  iMooc
//
//  Created by qianfeng on 16/5/21.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQHeaderReusableView.h"

@interface SQHeaderReusableView ()

@property (nonatomic,strong)UILabel *label;

@end

@implementation SQHeaderReusableView

//重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //创建UI
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width - 20, self.frame.size.height)];
    
    _label.textColor = [UIColor blackColor];
    
    _label.backgroundColor = [UIColor clearColor];
    
    _label.font = [UIFont systemFontOfSize:13];
    
    [self addSubview:_label];
}

- (void)refreshTitle:(NSString *)title
{
    _label.text = title;
}


@end
