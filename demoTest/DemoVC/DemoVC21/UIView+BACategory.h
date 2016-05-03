//
//  UIView+BACategory.h
//  demoTest
//
//  Created by 博爱 on 16/4/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+BACategory.h"

@interface UIView (BACategory)

/*!
 *  设置圆角
 *
 *  @param radius radius （CGFloat topLeft; topRight; bottomLeft; bottomRitht;）
 */
- (void)BA_setViewRadius:(BAViewRadiusStruct)radius;

/*!
 *  设置view
 *
 *  @param radius          圆角
 *  @param backgroundColor backgroundColor
 *  @param borderWidth     borderWidth
 */
-(void)BA_setViewCornerRadius:(CGFloat )radius withBackgroundColor:(UIColor *)backgroundColor borderWidth:(CGFloat )borderWidth;


@end
