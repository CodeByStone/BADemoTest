//
//  BAButton.m
//  hookTest
//
//  Created by 博爱 on 16/4/1.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAButton.h"

/*! 定义宏：按钮中文本和图片的间隔 */
#define BA_padding 7
#define BA_btnRadio 0.6
/*! 获得按钮的大小 */
#define BA_btnWidth       self.bounds.size.width
#define BA_btnHeight      self.bounds.size.height
/*! 获得按钮中UILabel文本的大小 */
#define BA_labelWidth     self.titleLabel.bounds.size.width
#define BA_labelHeight    self.titleLabel.bounds.size.height
/*! 获得按钮中image图标的大小 */
#define BA_imageWidth     self.imageView.bounds.size.width
#define BA_imageHeight    self.imageView.bounds.size.height


@implementation BAButton

+ (instancetype)BA_ShareButton
{
    return [[self alloc] init];
}

- (instancetype)initWitAligenmentStatus:(BAAligenmentStatus)status
{
    BAButton *button = [[BAButton alloc] init];
    button.buttonStatus = status;
    return button;
}

- (void)setButtonStatus:(BAAligenmentStatus)buttonStatus
{
    _buttonStatus = buttonStatus;
}
// https://github.com/gitkong/FLButtonDemo
#pragma mark - 左对齐
- (void)alignmentLeft
{
    //    获得按钮的文本的frame
    CGRect titleFrame = self.titleLabel.frame;
    //    设置按钮的文本的x坐标为0-－－左对齐
    titleFrame.origin.x = 0;
    //    获得按钮的图片的frame
    CGRect imageFrame = self.imageView.frame;
    //    设置按钮的图片的x坐标紧跟文本的后面
    imageFrame.origin.x = CGRectGetWidth(titleFrame);
    
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}

#pragma mark - 右对齐
- (void)alignmentCenter
{
    CGFloat labelX = (BA_btnWidth - BA_labelWidth - BA_imageWidth - BA_padding) * 0.5;
    CGFloat labelY = (BA_btnHeight - BA_labelHeight) * 0.5;
    
    self.titleLabel.frame = CGRectMake(labelX, labelY, BA_labelWidth, BA_btnHeight);
    
    CGFloat imageX = CGRectGetMaxX(self.titleLabel.frame) + BA_padding;
    
    
    
}








@end
