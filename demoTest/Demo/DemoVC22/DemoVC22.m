//
//  DemoVC22.m
//  demoTest
//
//  Created by 博爱 on 16/4/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC22.h"
#import "BATextView.h"

@interface DemoVC22 ()

@end

@implementation DemoVC22

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}

- (void)creatUI
{
    BATextView *textView = [[BATextView alloc] init];
    textView.frame = CGRectMake(10, 20, BA_SCREEN_WIDTH - 20, 200);
    textView.placeholder = @"关注微博：博爱1616，获取更多ios开发相关信息！";
    textView.backgroundColor = BA_BGGrayColor;
    textView.placeholderTextColor = BA_Red_Color;
    textView.textColor = BA_TEXTGrayColor;
    [self.view addSubview:textView];
    
    /*! 
     
     UIDataDetectorTypes
     
     用于UITextView或者UIWebView，属性名一般为dataDetectorTypes。
     此属性可以设定使电话号码、网址、电子邮件和符合格式的日期等文字变为链接文字。
     电话号码点击后拨出电话，网址点击后会用Safari打开，电子邮件会用mail打开，而符合格式的日期会弹出一个ActionSheet，有创建事件，在Calendar中显示，和拷贝三个选项。
     
     同时我们也可以定制他的链接内容。比如只有电话变为链接，或者只有网址变为链接，或者都不变。
     
     enum {
     UIDataDetectorTypePhoneNumber   = 1 << 0,          // Phone number detection
     UIDataDetectorTypeLink          = 1 << 1,          // URL detection
     #if __IPHONE_4_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
     UIDataDetectorTypeAddress       = 1 << 2,          // Street address detection
     UIDataDetectorTypeCalendarEvent = 1 << 3,          // Event detection
     #endif
     
     UIDataDetectorTypeNone          = 0,               // No detection at all
     UIDataDetectorTypeAll           = NSUIntegerMax    // All types
     };
     
     typedef NSUInteger UIDataDetectorTypes;
     
     以上是UIKit框架中，UIDataDetectors.h文件内关于UIDataDetectorTypes的定义。由定义可以看出，我们可以使用|的关系来指定自己想要的链接化文字的方式。
     
     */
    
    UITextView *textView2 = [[UITextView alloc] init];
    textView2.frame = CGRectMake(textView.x, textView.bottom + 10, textView.width, 200);
    textView2.dataDetectorTypes = UIDataDetectorTypeAll;
    textView2.font = BA_FontSize(18);
    textView2.editable = NO;
    textView2.text = @"我的微博：博爱1616 \r\n\r\n"
    "我的手机号码是：18588888888 \r\n\r\n"
    "我的git主页：https://github.com/boai \r\n\r\n"
    "我的博客主页：http://www.cnblogs.com/boai/ \r\n\r\n";
    textView2.textColor = BA_White_Color;
    textView2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:textView2];
}


@end
