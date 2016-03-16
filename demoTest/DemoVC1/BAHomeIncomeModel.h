//
//  BAHomeIncomeModel.h
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YRHomeIncomeModelData;
@interface BAHomeIncomeModel : NSObject


@property (nonatomic, assign) NSInteger result;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<YRHomeIncomeModelData *> *data;

@end

@interface YRHomeIncomeModelData : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *score;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *headImg;

@property (nonatomic, copy) NSString *imId;

@end

