//
//  DemoVC18.m
//  demoTest
//
//  Created by 博爱 on 16/4/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC18.h"

@interface DemoVC18 ()

@end

@implementation DemoVC18

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_White_Color;
    [self BA_useGIFImageViewWithGifImageName:@"gif1.gif" frame:CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT)];
    
}



@end
