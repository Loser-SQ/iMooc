//
//  UITabBarController+SQ_AddChildController.h
//  iMooc
//
//  Created by qianfeng on 16/5/17.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (SQ_AddChildController)

- (void) addChildTabBarController:(NSString *)title controller:(NSString *)controllerName unSelectedImage:(NSString *)unSelectedImageName selectedImage:(NSString *)selectdImageName;

@end
