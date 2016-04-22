//
//  DemoVC21.m
//  demoTest
//
//  Created by 博爱 on 16/4/21.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC21.h"
#import "UIView+BACategory.h"

@interface DemoVC21 ()
{
    UIImageView *_imageView1;
    UIImageView *_imageView2;
    UIImageView *_imageView3;
    UIImageView *_imageView4;
    UIImageView *_imageView5;
    UIImageView *_imageView6;

}


@end

@implementation DemoVC21

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_BGGrayColor;
    
    [self creatUI];
}

- (void)creatUI
{
    //
    _imageView1 = [[UIImageView alloc] init];
    _imageView1.frame = CGRectMake(50, 10, 50, 50);
    [_imageView1 setCornerRadius:_imageView1.width/2];
    _imageView1.backgroundColor = BA_Green_Color;
    _imageView1.clipsToBounds = YES;
    _imageView1.image = [UIImage imageNamed:@"12.jpg"];
    
 
    _imageView2 = [[UIImageView alloc] init];
    _imageView2.frame = CGRectMake(_imageView1.x, _imageView1.bottom + 10, _imageView1.width, _imageView1.height);
    _imageView2.image = [UIImage imageNamed:@"12.jpg"];
    [_imageView2 BA_setViewCornerRadius:10 withBackgroundColor:BA_Green_Color borderWidth:1];

    
    // 部分圆角
    _imageView3 = [[UIImageView alloc] init];
    _imageView3.frame = CGRectMake(_imageView1.x, _imageView2.bottom + 10, _imageView1.width, _imageView1.height);
    _imageView3.backgroundColor = [UIColor redColor];
    _imageView3.image = [UIImage imageNamed:@"12.jpg"];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_imageView3.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _imageView3.bounds;
    maskLayer.path = maskPath.CGPath;
    _imageView3.layer.mask = maskLayer;
    
    // 第三方库，离屏渲染
    _imageView4 = [[UIImageView alloc] init];
    _imageView4.frame = CGRectMake(_imageView1.x, _imageView3.bottom + 10, _imageView1.width, _imageView1.height);
    [_imageView4 jm_setCornerRadius:_imageView4.width/2 withImage:[UIImage imageNamed:@"12.jpg"]];

    // 自行切图
    _imageView5 = [[UIImageView alloc] init];
    _imageView5.frame = CGRectMake(_imageView1.x, _imageView4.bottom + 10, _imageView1.width, _imageView1.height);
    _imageView5.image = [[UIImage imageNamed:@"12.jpg"] BA_circleImage];

    // 自行切图2
    _imageView6 = [[UIImageView alloc] init];
    _imageView6.frame = CGRectMake(_imageView1.x, _imageView5.bottom + 10, _imageView1.width, _imageView1.height);
    _imageView6.image = [UIImage circleImageWithName:@"12.jpg" borderWidth:1.0 borderColor:BA_Green_Color];

    
    [self.view addSubview:_imageView1];
    [self.view addSubview:_imageView2];
    [self.view addSubview:_imageView3];
    [self.view addSubview:_imageView4];
    [self.view addSubview:_imageView5];
    [self.view addSubview:_imageView6];

    [self.view setCornerRadius:12.0f];
}





@end
