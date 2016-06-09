//
//  UIImage+SQ_OriginalIamge.m
//  iMooc
//
//  Created by qianfeng on 16/5/17.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "UIImage+SQ_OriginalIamge.h"

@implementation UIImage (SQ_OriginalIamge)

@dynamic originalImage;

- (UIImage *)originalImage
{
    NSString *version = [UIDevice currentDevice].systemVersion;
    
    // 判断版本号
    if (version.floatValue >= 7.0)
    {
        // 说明是iOS7之后的版本
        return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    return self;
}

@end
