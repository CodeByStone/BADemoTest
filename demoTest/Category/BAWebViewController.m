//
//  BAWebViewController.m
//  demoTest
//
//  Created by 博爱 on 16/3/29.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAWebViewController.h"

@implementation BAWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH , BA_SCREEN_HEIGHT)];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    self.webView.scalesPageToFit = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!self.haveLoaded) {
        [self refreshWholeView];
    }
}

- (void)backHome
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)refreshWholeView
{
    if ([self.urlString length]>0) {
        //        NSString *string = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self.urlString,CFSTR(""),CFSTR(" "),kCFStringEncodingUTF8));//空格变成％20
        NSString *string = [self.urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *url = [NSURL URLWithString:string];
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //    [self hiddenWaitAcitivityViews];
    if(error.code != -999){
        
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString = [request.URL absoluteString];
    NSLog(@"urlString:%@",urlString);
    return YES;
}

@end
