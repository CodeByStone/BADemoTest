//
//  BACustomButton.m
//  yrapp
//
//  Created by 博爱 on 16/3/14.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import "BACustomButton.h"

@implementation BACustomButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.y = 10;
    self.imageView.centerX = self.width/2;
    
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height + 10;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height - 10;
    self.titleLabel.font = BA_FontSize(14);
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


@end
