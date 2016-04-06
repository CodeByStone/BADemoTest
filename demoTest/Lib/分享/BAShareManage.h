//
//  ShareManage.h
//  yrapp
//
//  Created by 博爱 on 16/2/3.
//  Copyright © 2016年 有人科技. All rights reserved.
//  友盟分享工具类

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>


@protocol BAShareManageDelegate <NSObject>

/*! 代理方法1：获取选择的城市 */
- (void)getUserData:(NSDictionary *)backUserData;

@end
@interface BAShareManage : NSObject <MFMessageComposeViewControllerDelegate>

/** 登录后返回的数据 **/
@property (nonatomic, weak) id<BAShareManageDelegate> delegate;


+ (BAShareManage *)shareManage;

- (void)shareConfig;

#pragma mark - 友盟分享
/**微信分享**/
- (void)wxShareWithViewControll:(UIViewController *)viewC withShareText:(NSString *)shareText image:(UIImage *)shareImage url:(NSString *)shareURLString;

/**新浪微博分享**/
- (void)wbShareWithViewControll:(UIViewController *)viewC withShareText:(NSString *)shareText image:(UIImage *)shareImage;

/**微信朋友圈分享**/
- (void)wxpyqShareWithViewControll:(UIViewController *)viewC withShareText:(NSString *)shareText image:(UIImage *)shareImage url:shareURLString;

/**短信分享**/
- (void)smsShareWithViewControll:(UIViewController *)viewC withShareText:(NSString *)shareText image:(UIImage *)shareImage;

/**分享列表**/
- (void)shareListWithViewControll:(UIViewController *)viewC withShareText:(NSString *)shareText image:(UIImage *)shareImage url:(NSString *)shareURLString;

#pragma mark - 友盟登录
/**友盟 QQ 登录**/
- (void)BAQQLogin:(UIViewController *)viewController;

/**友盟 Qzone 登录**/
- (void)BAQzoneLogin:(UIViewController *)viewController;

/**友盟 新浪微博登录**/
- (void)BASinaLogin:(UIViewController *)viewController;
/**删除新浪微博登陆授权调用下面的方法**/
- (void)deleteSinaLogin;

/**友盟 微信 登录**/
- (void)BAWechatSessionLogin:(UIViewController *)viewController;

/**友盟登录列表**/
- (void)BAUMLoginListWithViewControll:(UIViewController *)viewController;

@end
