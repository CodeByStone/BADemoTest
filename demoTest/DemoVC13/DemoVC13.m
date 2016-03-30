//
//  DemoVC13.m
//  demoTest
//
//  Created by 博爱 on 16/3/29.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC13.h"
#import "UIWebView+BACustom.h"
#import "BAWebViewController.h"

@implementation DemoVC13

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_White_Color;
    
    // webVC加载
//    BAWebViewController *webVC = [BAWebViewController new];
//    webVC.urlString = @"http://www.cnblogs.com/boai/p/5337558.html";
//    [self.navigationController pushViewController:webVC animated:YES];
    
    // webView加载
    CGRect frame = CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT);
    NSString *urlStr = @"http://www.cnblogs.com/boai/p/5337558.html";
    
    UIWebView *webView = [UIWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr] ] loaded:^(UIWebView *webView) {
        NSLog(@"Loaded %@", webView.request.URL);
    } failed:^(UIWebView *webView, NSError *error) {
        NSLog(@"Failed loading with error: %@", error.localizedDescription);
    }];
    webView.frame = frame;
    webView.scalesPageToFit = YES;

    [self.view addSubview: webView];
}


@end
