//
//  SQFactory.h
//  iMooc
//
//  Created by qianfeng on 16/5/19.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQFactory : NSObject

+ (NSMutableDictionary *)DictionaryWithPage:(int)page token:(NSString *)token typeid:(NSInteger)typeid;

+ (NSMutableDictionary *)DictionaryWithPage:(int)page token:(NSString *)token  cat_type:(int)cat easy_type:(int)easy;

+ (NSMutableDictionary *)DictionaryWithPage:(int)page token:(NSString *)token keyword:(NSString *)key;

+ (NSMutableDictionary *)DictionaryWithAll_type:(int)all cat_type:(int)cat easy_type:(int)easy page:(int)page sort_type:(int)sort token:(NSString *)token;

+ (NSMutableDictionary *)DictionaryWithcid:(NSInteger)cid token:(NSString *)token;

@end
