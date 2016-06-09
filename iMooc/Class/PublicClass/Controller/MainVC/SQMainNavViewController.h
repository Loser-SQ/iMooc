//
//  SQMainNavViewController.h
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQMainNavViewController : UINavigationController
// 插入导航条上的透明view
@property (nonatomic,strong)UIView *transView;

@end

// 方便外界调用透明的view
@interface UINavigationController (transparant)

@property (nonatomic,strong, readonly) UIView *transView;

@end
