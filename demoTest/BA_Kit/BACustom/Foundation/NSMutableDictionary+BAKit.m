//
//  NSMutableDictionary+BAKit.m
//  IOS自定义常用控件
//
//  Created by shenzhaoliang on 15/2/28.
//  Copyright (c) 2015年 shundesoft. All rights reserved.
//

#import "NSMutableDictionary+BAKit.h"

@implementation NSMutableDictionary (BAKit)

/* 设置在安全模式下给定键的对象(如果不 为零) */
- (BOOL)safeSetObject:(id)anObject
               forKey:(id<NSCopying>)aKey
{
    if(nil == anObject)
    {
        return NO;
    }
    
    [self setObject:anObject
             forKey:aKey];
    return YES;
}

@end
