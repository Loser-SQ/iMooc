//
//  UIImage+SQColorOfPoint.h
//  iMooc
//
//  Created by qianfeng on 16/5/23.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SQColorOfPoint)

- (UIColor *)colorAtPixel:(CGPoint)point;

- (UIColor*)mostColor;

@end
