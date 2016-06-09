//
//  SQClassifyDetailViewController.h
//  iMooc
//
//  Created by qianfeng on 16/5/23.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "WMPageController.h"

@interface SQClassifyDetailViewController : WMPageController

@property (nonatomic,assign)NSInteger ID;

@property (nonatomic,strong)NSString *pic;

@property (nonatomic,strong)NSString *name;

+(instancetype)create;

@end
