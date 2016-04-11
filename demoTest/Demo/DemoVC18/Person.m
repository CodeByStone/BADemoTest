//
//  Person.m
//  runTimetest
//
//  Created by 博爱 on 16/4/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@interface Person () <NSCoding>

@end

@implementation Person

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count;
    // 获得指向当前类的所有属性的指针
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++)
    {
        // 获取指向当前类的一个属性的指针
        objc_property_t property = properties[i];
        // 获取C字符串属性名
        const char *name = property_getName(property);
        
        // C字符串转OC字符串
        NSString *propertyName = [NSString stringWithUTF8String:name];
        // 通过关键词取值
        NSString *propertyValue = [self valueForKey:propertyName];
        // 编码属性
        [aCoder encodeObject:propertyValue forKey:propertyName];
    }
    // 记得释放
    free(properties);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int count;
    
    // 获得指向当前类的所有属性的指针
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i<count; i++)
    {
        // 获取指向当前类的一个属性的指针
        objc_property_t propertiy = properties[i];
        // 获取C字符串属性名
        const char *name = property_getName(propertiy);
        // C字符串转OC字符串
        NSString *propertyName = [NSString stringWithUTF8String:name];
        // 解码属性值
        NSString *propertyValue = [aDecoder decodeObjectForKey:propertyName];
        [self setValue:propertyValue forKey:propertyName];
    }
    // 记得释放
    free(properties);
    return self;
}

// 吃饭
- (void)eat {
    
}

// 睡觉
- (void)sleep {
    
}

// 工作
- (void)work {
    
}



@end
