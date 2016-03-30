//
//  DemoVC8.m
//  demoTest
//
//  Created by 博爱 on 16/3/19.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC8.h"
#import "DemoVC8_View1.h"

@interface DemoVC8 ()

@end

@implementation DemoVC8

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_White_Color;
    
    [self creatUI];
}

- (void)creatUI
{
    DemoVC8_View1 *subView1 = [DemoVC8_View1 new];
    
//    subView1.frame = self.view.bounds;
    
    [self.view addSubview:subView1];
    // 设置scrollview与父view的边距
    subView1.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    
}




@end
