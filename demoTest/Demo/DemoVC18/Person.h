//
//  Person.h
//  runTimetest
//
//  Created by 博爱 on 16/4/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonDelegate <NSObject>

- (void)personDelegateToWork;

@end

@interface Person : NSObject

#pragma mark - 属性
{
    NSString * _str1;
}
@property (nonatomic,assign) id<PersonDelegate> delegate;
@property (nonatomic,copy)   NSString           *name;// 姓名
@property (nonatomic,copy)   NSString           *sex;// 性别
@property (nonatomic,assign) int                 age;// 年龄
@property (nonatomic,assign) float               height;// 身高
@property (nonatomic,copy)   NSString           *job;// 工作
@property (nonatomic,copy)   NSString           *native;// 籍贯
@property (nonatomic,copy)   NSString           *education;// 学历

#pragma mark - 方法

/**
 *  吃饭
 */
- (void)eat;

/**
 *  睡觉
 */
- (void)sleep;

/**
 *  工作
 */
- (void)work;

// 利用runtime 进行model 解析
+ (instancetype)initWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;


@end
