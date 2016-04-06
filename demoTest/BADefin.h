//
//  BADefin.h
//  demoTest
//
//  Created by 博爱 on 16/3/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#ifndef BADefin_h
#define BADefin_h


#pragma mark - ***** AppDelegate
// 友盟分享SDK
#define YRUmengAppkey     @"56f217d467e58e513a000434"
#define kSinaAppKey       @"2447331824"
#define WX_APP_KEY        @"wx19d8c52e02fa7556"
#define WX_APP_SECRET     @"90eeb0c9ef2a1c99fb473890809f7f19"
#define kQQKey            @"wrGGgg89e0lqqoXT"
#define kQQAppID          @"1105285308"


#pragma mark - ***** frame设置
// 当前设备的屏幕宽度
#define BA_SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
// 当前设备的屏幕高度
#define BA_SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
// 导航栏高，前提控制器带导航栏
#define BA_NAV_HEIGHT CGRectGetHeight(self.navigationController.navigationBar.frame)
// 状态栏高度
#define BA_STATUSBAR_HEIGHT CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
// Tabbar 的高度
#define BA_getTabbarHeight 49
// 黄金比例的宽
#define BA_WIDTH_0_618 WIDTH * 0.618

// BABannerView.h 广告frame
#define YRBannerHeight 100
// 直播、点播页面 头高
#define YRLiveHeadViewHeight 250

// 字体
#define BA_FontSize(fontSize) [UIFont systemFontOfSize:fontSize]
/**
 * 随机数据
 */
#define BA_RandomData arc4random_uniform(5)




#pragma mark - ***** 颜色设置
// 颜色
#define BA_COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
// 随机色
#define YRRandomColor      [UIColor colorWithRed:arc4random_uniform(256)%255.0 green:arc4random_uniform(256)%255.0 blue:arc4random_uniform(256)%255.0 alpha:1.0]
// navi蓝色
#define BA_NaviBgBlueColor     BA_COLOR(92, 177, 251, 1.0)
#define BA_BGGrayColor        BA_COLOR(239, 239, 239, 1.0)
#define BA_TEXTGrayColor      BA_COLOR(148, 147, 133, 1.0)
#define BA_BLUEColor          BA_COLOR(78, 164, 255, 1.0)
#define BA_BGClearColor       [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.7f]
// 白色
#define BA_White_Color      [UIColor whiteColor]
// 红色
#define BA_Red_Color        [UIColor redColor]
// 白色
#define BA_Yellow_Color     [UIColor yellowColor]
// 白色
#define BA_Green_Color      [UIColor greenColor]
// 白色
#define BA_Blue_Color       [UIColor blueColor]



// 警告框-一个按钮【VC】
#define BA_SHOW_ALERT(title, msg)  UIAlertController *alert = [UIAlertController alertControllerWithTitle:title  message:msg preferredStyle:UIAlertControllerStyleAlert];\
[alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {\
NSLog(@"你点击了确定按钮！");\
}]];\
[self presentViewController:alert animated:YES completion:nil];\
// 警告框-一个按钮【View】
#define BA_SHOW_AlertAtView(msg) [[[UIAlertView alloc] initWithTitle:@"温馨提示：" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil] show];


#endif /* BADefin_h */
