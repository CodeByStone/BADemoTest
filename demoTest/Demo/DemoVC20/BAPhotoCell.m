//
//  BAPhotoCell.m
//  自定义layout
//
//  Created by 博爱 on 16/4/12.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAPhotoCell.h"

@implementation BAPhotoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView
{
    _imageView = [UIImageView new];
    _imageView.frame = CGRectMake(0, 10, self.frame.size.width, self.frame.size.height - 40);
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.layer.borderColor = [UIColor greenColor].CGColor;
    _imageView.layer.borderWidth = 5;
    
    _title = [UILabel new];
    _title.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame), self.frame.size.width, 30);
    _title.font = [UIFont systemFontOfSize:14];
    _title.textAlignment = NSTextAlignmentCenter;

    
    [self.contentView addSubview:_imageView];
    [self.contentView addSubview:_title];

}

@end
