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
        objc_property_t property = properties[i];
        // 获取C字符串属性名
        const char *name = property_getName(property);
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

+ (instancetype)initWithDict:(NSDictionary *)dict
{
    return [self initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [self init])
    {
        // (1)获取类的属性及属性对应的类型
        NSMutableArray *keys = [NSMutableArray array];
        NSMutableArray *attributes = [NSMutableArray array];
        
        /*
         * 例子
         * name = value3 attribute = T@"NSString",C,N,V_value3
         * name = value4 attribute = T^i,N,V_value4
         */
        
        unsigned int outCount;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        for (int i = 0; i < outCount; i ++)
        {
            objc_property_t property = properties[i];
            // 获取C字符串属性名
            const char *name = property_getName(property);
            // C字符串转OC字符串
            NSString *propertyName = [NSString stringWithUTF8String:name];
            // NSString * propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
             [keys addObject:propertyName];
            
            // 通过property_getAttributes函数可以获得属性的名字和@encode编码
            NSString *propertyAttribute = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            [attributes addObject:propertyAttribute];
        }
        // 立即释放properties指向的内存
        free(properties);
        
        // (2)根据类型给属性赋值
        for (NSString *key in keys)
        {
            if ([dict valueForKey:key] == nil) continue;
            [self setValue:[dict valueForKey:key] forKey:key];
        }
    }
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
