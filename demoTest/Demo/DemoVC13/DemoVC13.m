//
//  DemoVC13.m
//  demoTest
//
//  Created by 博爱 on 16/3/29.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC13.h"

@implementation DemoVC13

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_White_Color;

    // webView加载
    CGRect frame = CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT);
    NSString *urlStr = @"http://www.cnblogs.com/boai/p/5337558.html";
    
//    NSString *url;
//    if ([NSString BA_url_isURL:_urlStr])
//    {
//        url = _urlStr;
//    }
//    else
//    {
//        [self.view showAlertView:@"温馨提示：" message:@"不能识别的二维码！"];
//    }
    
    UIWebView *webView = [UIWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr] ] loaded:^(UIWebView *webView) {
        BALog(@"Loaded %@", webView.request.URL);
    } failed:^(UIWebView *webView, NSError *error) {
        BALog(@"Failed loading with error: %@", error.localizedDescription);
    }];
    
    [webView bk_setDidFinishLoadBlock:^(UIWebView *webView) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        self.currentTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];//获取当前页面的title
        self.title = self.currentTitle;
        
                self.currentURL = webView.request.URL.absoluteString;
        NSLog(@"title-%@--url-%@--",self.title,urlStr);
        
        //        NSString *lJs = @"document.documentElement.innerHTML";//获取当前网页的html
        //        currentHTML = [webView stringByEvaluatingJavaScriptFromString:lJs];
    }];
    webView.frame = frame;
    webView.scalesPageToFit = YES;
    
    [self.view addSubview: webView];
}


@end
