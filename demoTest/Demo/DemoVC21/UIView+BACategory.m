//
//  UIView+BACategory.m
//  demoTest
//
//  Created by 博爱 on 16/4/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "UIView+BACategory.h"

@implementation UIView (BACategory)

/*!
 *  设置圆角
 *
 *  @param radius radius （CGFloat topLeft; topRight; bottomLeft; bottomRitht;）
 */
- (void)BA_setViewRadius:(BAViewRadiusStruct)radius
{
    CGSize size = self.bounds.size;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    
    // 设置上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //边框大小
//    CGContextSetLineWidth(context, 1);
    // 边框颜色
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    // 矩形填充颜色
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // topLeft
    CGPoint point = CGPointMake(size.width - radius.topLeft, radius.topLeft);
    [path addArcWithCenter:point radius:radius.topLeft startAngle:M_PI endAngle:M_PI_2 * 3.0 clockwise:YES];
    
    // topRight
    CGPoint point1 = CGPointMake(size.width - radius.topRight, radius.topRight);
    [path addArcWithCenter:point1 radius:radius.topRight startAngle:-M_PI_2 endAngle:0.0f clockwise:YES];
    
    // bottomLeft
    CGPoint point3 = CGPointMake(size.width - radius.bottomLeft, radius.bottomLeft);
    [path addArcWithCenter:point3 radius:radius.bottomLeft startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    
    // bottomRitht
    CGPoint point2 = CGPointMake(size.width - radius.bottomRitht, radius.bottomRitht);
    [path addArcWithCenter:point2 radius:radius.bottomRitht startAngle:0.0f endAngle:M_PI_2 clockwise:YES];
    
    //    [path addQuadCurveToPoint:CGPointMake(size.width, size.height * 0.5) controlPoint:CGPointMake(size.width * 0.5, size.height * 0.5 - size.width * 0.5)];
    
    //    [path addArcWithCenter:CGPointMake(100, 100 ) radius:50 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
    //    [path addArcWithCenter:CGPointMake(100, 100 ) radius:50 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    //    [path addArcWithCenter:CGPointMake(100, 100 ) radius:50 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    //    [path addArcWithCenter:CGPointMake(100, 100 ) radius:50 startAngle:M_PI endAngle:3.0 * M_PI_2 clockwise:YES];
    
    CGContextAddPath(context, path.CGPath);
    // 根据坐标绘制路径
    CGContextDrawPath(context, kCGPathFill);
    UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.layer.contents = (__bridge id)outImage.CGImage;
}

/*!
 *  设置view
 *
 *  @param radius          圆角
 *  @param backgroundColor backgroundColor
 *  @param borderWidth     borderWidth
 */
-(void)BA_setViewCornerRadius:(CGFloat )radius withBackgroundColor:(UIColor *)backgroundColor borderWidth:(CGFloat )borderWidth
{
    CGSize size = self.bounds.size;
    CGFloat halfBorderWidth = borderWidth * 0.5;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    
    // 设置上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 边框大小
    CGContextSetLineWidth(context, borderWidth);
    // 边框颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    // 矩形填充颜色
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGPoint point = CGPointMake(size.width * 0.5, size.height * 0.5);
    [path addArcWithCenter:point radius:size.width * 0.5 - halfBorderWidth startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    CGContextAddPath(context, path.CGPath);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    // 裁剪
    CGContextClip(context);
    
    UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
    [path closePath];
    
    UIGraphicsEndImageContext();
    
    self.layer.contents = (__bridge id)outImage.CGImage;
}

@end
