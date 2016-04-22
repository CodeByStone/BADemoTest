//
//  UIImageView+BAKit.m
//  IOS自定义常用控件
//
//  Created by shenzhaoliang on 15/2/26.
//  Copyright (c) 2015年 shundesoft. All rights reserved.
//

#import "UIImageView+BAKit.h"

@implementation UIImageView (BAKit)

/* 给定图片、框架初始化UIImageView */
+ (id)initWithImage:(UIImage *)image
              frame:(CGRect)rect
{
    UIImageView *_image = [[UIImageView alloc] init];
    [_image setFrame:rect];
    [_image setImage:image];
    return _image;
}

/* 给定图片、尺寸、中心点初始化UIImageView */
+ (id)initWithImage:(UIImage *)image
               size:(CGSize)size
             center:(CGPoint)center
{
    UIImageView *_image = [[UIImageView alloc] init];
    [_image setFrame:CGRectMake(0, 0, size.width, size.height)];
    [_image setImage:image];
    [_image setCenter:center];
    return _image;
}

+ (UIImageView *)addImgWithFrame:(CGRect)frame AndImage:(NSString *)imgName
{
    UIImageView *imgView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName]];
    
    imgView.frame = frame;
    return imgView;
}

/*!
 *  显示成圆形图片
 */
- (void)setRadiusImg
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.width/2;
}

@end
