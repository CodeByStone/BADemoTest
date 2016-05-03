//
//  DemoVC26_QRCodeVC.m
//  demoTest
//
//  Created by 博爱 on 16/5/3.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC26_QRCodeVC.h"


@interface DemoVC26_QRCodeVC ()

@end

@implementation DemoVC26_QRCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // webView加载
    CGRect frame = CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT);
    NSString *url;
    if ([NSString BA_url_isURL:_urlStr])
    {
        url = _urlStr;
    }
    else
    {
        [self.view showAlertView:@"温馨提示：" message:@"不能识别的二维码！"];
    }
    
    UIWebView *webView = [UIWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url] ] loaded:^(UIWebView *webView) {
        BALog(@"Loaded %@", webView.request.URL);
    } failed:^(UIWebView *webView, NSError *error) {
        BALog(@"Failed loading with error: %@", error.localizedDescription);
    }];

    [webView bk_setDidFinishLoadBlock:^(UIWebView *webView) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        self.currentTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];//获取当前页面的title
        self.title = self.currentTitle;

//        self.currentURL = webView.request.URL.absoluteString;
        NSLog(@"title-%@--url-%@--",self.title,self.urlStr);
        
//        NSString *lJs = @"document.documentElement.innerHTML";//获取当前网页的html
//        currentHTML = [webView stringByEvaluatingJavaScriptFromString:lJs];
    }];
    webView.frame = frame;
    webView.scalesPageToFit = YES;
    
    [self.view addSubview: webView];
}



@end
