//
//  DemoVC24_NSNotificationVC.m
//  demoTest
//
//  Created by 博爱 on 16/4/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC24_NSNotificationVC.h"

@interface DemoVC24_NSNotificationVC ()
{
    BATextView *_textView1;
    BATextView *_textView2;

}


@end

@implementation DemoVC24_NSNotificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_Green_Color;
    
    _textView1 = [[BATextView alloc] init];
    _textView1.frame = CGRectMake(10, 20, BA_SCREEN_WIDTH - 20, 50);
    _textView1.placeholder = @"用户名：";
    _textView1.backgroundColor = BA_BGGrayColor;
    _textView1.placeholderTextColor = BA_Red_Color;
    _textView1.textColor = BA_TEXTGrayColor;
    
    _textView2 = [[BATextView alloc] init];
    _textView2.frame = CGRectMake(_textView1.x, _textView1.bottom + 10, _textView1.width, 50);
    _textView2.placeholder = @"密码：";
    _textView2.backgroundColor = BA_BGGrayColor;
    _textView2.placeholderTextColor = BA_Red_Color;
    _textView2.textColor = BA_TEXTGrayColor;
    
    BACustomButton *btn = [BACustomButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(_textView1.x, _textView2.bottom + 10, _textView2.width, 50);
    [btn setTitle:@"返回上一页面" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_textView1];
    [self.view addSubview:_textView2];
    [self.view addSubview:btn];
}

- (IBAction)clickBtn:(BACustomButton *)sender
{
    // 1.创建userInfo携带的信息
    NSString *nameStr = _textView1.text;
    NSString *pwdStr = _textView2.text;

    NSDictionary *dictData = @{@"name":nameStr, @"pwd":pwdStr};
    // 2.发布信息
    [BA_Noti postNotificationName:@"MyNotificationName" object:nil userInfo:dictData];
    // 返回视图A并发布通知
    [self.navigationController popViewControllerAnimated:YES];

}



@end
