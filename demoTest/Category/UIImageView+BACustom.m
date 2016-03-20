//
//  UIImageView+BACustom.m
//  demoTest
//
//  Created by 博爱之家 on 16/3/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "UIImageView+BACustom.h"

@implementation UIImageView (BACustom)

+(UIImageView *)addImgWithFrame:(CGRect)frame AndImage:(NSString *)imgName
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
