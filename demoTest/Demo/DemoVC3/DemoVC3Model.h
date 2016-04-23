//
//  DemoVC3Model.h
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoVC3Model : NSObject

@property (nonatomic, copy            ) NSString  *title;
@property (nonatomic, copy            ) NSString  *playNumber;
@property (nonatomic, copy            ) NSString  *content;

@property (nonatomic, assign          ) BOOL       isOpening;

@property (nonatomic, assign, readonly) BOOL       shouldShowMoreButton;


@end
