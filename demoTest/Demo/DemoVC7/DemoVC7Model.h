//
//  DemoVC7Model.h
//  demoTest
//
//  Created by 博爱 on 16/3/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoVC7Model : NSObject

// 头像
@property (nonatomic, copy) NSString *imageName;
// 用户名
@property (nonatomic, copy) NSString *userName;
// 时间
@property (nonatomic, copy) NSString *time;
// 文字内容
@property (nonatomic, copy) NSString *content;
// 星星
@property (nonatomic, copy) NSString *starNumber;
// 点赞数
@property (nonatomic, copy) NSString *supportNumber;

@end
