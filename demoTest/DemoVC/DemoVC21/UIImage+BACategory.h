//
//  UIImage+BACategory.h
//  demoTest
//
//  Created by 博爱 on 16/4/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct _BAViewRadiusStruct{
    CGFloat topLeft;
    CGFloat topRight;
    CGFloat bottomLeft;
    CGFloat bottomRitht;
} BAViewRadiusStruct;

static inline BAViewRadiusStruct BAViewRadiusMake(CGFloat topLeft, CGFloat topRight, CGFloat bottomLeft, CGFloat bottomRitht)
{
    BAViewRadiusStruct baViewRadius;
    baViewRadius.topLeft     = topLeft;
    baViewRadius.topRight    = topRight;
    baViewRadius.bottomLeft  = bottomLeft;
    baViewRadius.bottomRitht = bottomRitht;

    return baViewRadius;
}

@interface UIImage (BACategory)

@end
