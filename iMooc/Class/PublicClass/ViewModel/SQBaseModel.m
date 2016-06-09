//
//  SQBaseModel.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQBaseModel.h"

@implementation SQBaseModel

+ (JSONKeyMapper *)keyMapper {
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id": @"ID"}];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end
