//
//  AppDelegate.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "BANavigationController.h"
#import "AppDelegate+BATest.h"
#import "AppDelegate+Category.h"


// 友盟分享
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaSSOHandler.h"

#import "BAChineseString.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    ViewController *vc = [[ViewController alloc] init];
    BANavigationController *nav = [[BANavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window.rootViewController = nav;
    [NSThread sleepForTimeInterval:1.0]; //延长启动页面时间
    [self.window makeKeyAndVisible];
    
    // 键盘
    [self completionHandleIQKeyboard];
    
    // 测试
    [self test];
    
    // 友盟分享
    [self addShareOpt];

    
    return YES;
}

// 键盘
- (void)completionHandleIQKeyboard
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
}

#pragma mark - *****  友盟分享
-(void)addShareOpt
{
    // ************* 友盟分享 *************
    [UMSocialData setAppKey:YRUmengAppkey];
    // 打开调试log的开关
//    [UMSocialData openLog:YES];
    
    // 如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskAll];
    
    /*苹果审核要求,隐藏未安装的应用 的分享选项 */
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToSina, UMShareToQQ, UMShareToQzone, UMShareToWechatSession, UMShareToWechatTimeline]];
    
    // 打开新浪微博的SSO开关
    // 将在新浪微博注册的应用appkey、redirectURL替换下面参数，并在info.plist的URL Scheme中相应添加wb+appkey，如"wb3112175844"，详情请参考官方文档。
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:kSinaAppKey
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    //  添加微信分享授权
    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:WX_APP_KEY appSecret:WX_APP_SECRET url:@"http://www.baidu.com"];
    
    // 设置分享到QQ空间的应用Id，和分享url 链接
    [UMSocialQQHandler setQQWithAppId:kQQAppID appKey:kQQKey url:@"http://www.baidu.com"];
    // 设置支持没有客户端情况下使用SSO授权
    [UMSocialQQHandler setSupportWebView:YES];
    
    UMSocialSnsPlatform *copyPlatform = [[UMSocialSnsPlatform alloc] initWithPlatformName:@"copy"];
    copyPlatform.displayName = @"复制";
    copyPlatform.smallImageName = @"icon"; //用于tableView样式的分享列表
    copyPlatform.bigImageName = @"icon"; //用于actionsheet样式的分享列表
    copyPlatform.snsClickHandler = ^(UIViewController *presentingController, UMSocialControllerService * socialControllerService, BOOL isPresentInController){ BALog(@"copy!"); };                                                                                                                                                                                                          [UMSocialConfig addSocialSnsPlatform:@[copyPlatform]];                                                                                                                                                                                                        [UMSocialConfig setSnsPlatformNames:@[UMShareToSina, UMShareToWechatSession, UMShareToWechatTimeline, UMShareToQQ, UMShareToQzone]];
}

/**
 这里处理新浪微博SSO授权之后跳转回来，和微信分享完成之后跳转回来
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}

/**
 这里处理新浪微博SSO授权进入新浪微博客户端后进入后台，再返回原来应用
 */
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [UMSocialSnsService  applicationDidBecomeActive];
    [application setApplicationIconBadgeNumber:0];
    return;
}

@end
