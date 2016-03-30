//
//  BAWebViewController.h
//  demoTest
//
//  Created by 博爱 on 16/3/29.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAWebViewController.h"
//#import "UIWebView+AFNetworking.h"

@interface BAWebViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, retain) UIWebView *webView;

@property (nonatomic, assign) BOOL haveLoaded;
@end

