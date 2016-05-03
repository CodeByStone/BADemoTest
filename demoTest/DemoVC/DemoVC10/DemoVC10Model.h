//
//  DemoVC10Model.h
//  demoTest
//
//  Created by 博爱 on 16/3/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoVC10Model : NSObject

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *commentNumber;

@property (nonatomic, assign) BOOL isShowReplyCell;

@end
