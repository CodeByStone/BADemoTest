//
//  BAButton.h
//  hookTest
//
//  Created by 博爱 on 16/4/1.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

/*! 图标在上，文本在下按钮的图文间隔比例（0-1），默认0.8 */
#define BA_ButtonTopRadio 0.8

/*! 图标在下，文本在上按钮的图文间隔比例（0-1），默认0.5 */
#define BA_ButtonBottomRadio 0.5

typedef enum{
    BAAligenmentStatusNormal, // 默认
    BAAligenmentStatusLeft, // 左对齐
    BAAligenmentStatusCenter, // 居中对齐
    BAAligenmentStatusRight, // 右对齐
    BAAligenmentStatusTop, // 图标在上，文本在下(居中)
    BAAligenmentStatusBottom, // 图标在下，文本在上(居中)
}BAAligenmentStatus;

@interface BAButton : UIButton

@property (nonatomic, assign) BAAligenmentStatus buttonStatus;

/*! 外界通过设置按钮的status属性，创建不同类型的按钮 */
+ (instancetype)BA_ShareButton;

- (instancetype)initWitAligenmentStatus:(BAAligenmentStatus)status;


@end
