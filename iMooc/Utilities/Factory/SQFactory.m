//
//  SQFactory.m
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import "SQFactory.h"

@implementation SQFactory

+ (NSMutableDictionary *)DictionaryWithPage:(int)page token:(NSString *)token  cat_type:(int)cat easy_type:(int)easy
{
    NSDictionary *dict = @{
                           @"page": @(page),
                           @"token": token,
                           @"cat_type": @(cat),
                           @"easy_type": @(easy)
                           };
    
    
    
    return (NSMutableDictionary *)dict;
}



+ (NSMutableDictionary *)DictionaryWithPage:(int)page token:(NSString *)token keyword:(NSString *)key
{
    NSDictionary *dict = @{
                           @"page": @(page),
                           @"token": token,
                           @"keyword": key
                           };
    
    return (NSMutableDictionary *)dict;
}

+ (NSMutableDictionary *)DictionaryWithPage:(int)page token:(NSString *)token typeid:(NSInteger)typeid
{
    NSDictionary *dict = @{
                           @"page": @(page),
                           @"token": token,
                           @"typeid": @(typeid)
                           };
    
    return (NSMutableDictionary *)dict;
}

+ (NSMutableDictionary *)DictionaryWithAll_type:(int)all cat_type:(int)cat easy_type:(int)easy page:(int)page sort_type:(int)sort token:(NSString *)token
{
    NSDictionary *dict = @{
                           @"all_type": @(all),
                           @"cat_type": @(cat),
                           @"easy_type": @(easy),
                           @"page": @(page),
                           @"sort_type": @(sort),
                           @"token": token
                           };
    
    return (NSMutableDictionary *)dict;
}

+ (NSMutableDictionary *)DictionaryWithcid:(NSInteger)cid token:(NSString *)token
{
    NSDictionary *dict = @{
                           @"cid": @(cid),
                           @"token": token
                           };
    
    return (NSMutableDictionary *)dict;
}

@end
