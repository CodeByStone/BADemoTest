//
//  UIImageView+BACustom.h
//  demoTest
//
//  Created by 博爱之家 on 16/3/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BACustom)

/**
 *  创建UIImageView
 *
 *  @param frame   frame description
 *  @param imgName imgName description
 *
 *  @return UIImageView
 */
+(UIImageView *)addImgWithFrame:(CGRect)frame AndImage:(NSString *)imgName;


/*!
 *  显示成圆形图片
 */
- (void)setRadiusImg;

+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;


@end
