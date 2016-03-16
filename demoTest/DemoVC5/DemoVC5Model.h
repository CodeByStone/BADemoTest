//
//  DemoVC5Model.h
//  demoTest
//
//  Created by 博爱 on 16/3/16.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DemoVC5ModelData,Reviews,Author,Page;
@interface DemoVC5Model : NSObject


@property (nonatomic, assign) NSInteger result;

@property (nonatomic, strong) DemoVC5ModelData *data;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) Page *page;

@end

@interface DemoVC5ModelData : NSObject

@property (nonatomic, copy) NSString *qid;

@property (nonatomic, strong) NSArray<Reviews *> *reviews;

@end

@interface Reviews : NSObject

@property (nonatomic, copy) NSString *cTime;

@property (nonatomic, copy) NSString *rId;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, strong) Author *author;

@end

@interface Author : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *headImg;

@property (nonatomic, copy) NSString *imId;

@end

@interface Page : NSObject

@property (nonatomic, copy) NSString *count;

@property (nonatomic, copy) NSString *pageSize;

@property (nonatomic, copy) NSString *cuPage;

@end

