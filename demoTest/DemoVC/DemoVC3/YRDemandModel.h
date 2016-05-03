//
//  YRDemandModel.h
//  yrapp
//
//  Created by 博爱 on 16/3/2.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YRDemandModelData,YRDemandModelAuthor;
@interface YRDemandModel : NSObject


@property (nonatomic, assign) NSInteger result;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) YRDemandModelData *data;


@end

@interface YRDemandModelData : NSObject

@property (nonatomic, copy) NSString *upTime;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *reviewNum;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) YRDemandModelAuthor *author;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *videoId;

@property (nonatomic, copy) NSString *dId;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *viewNum;

@end

@interface YRDemandModelAuthor : NSObject

@property (nonatomic, copy) NSString *imId;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *headImg;

@property (nonatomic, copy) NSString *desc;

@end

