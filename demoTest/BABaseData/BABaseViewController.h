//
//  BABaseViewController.h
//  demoTest
//
//  Created by 博爱 on 16/4/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BABaseViewController : UIViewController

/*!
 *  是否隐藏naviBar
 *
 *  @param hidden YES：隐藏，NO：显示
 */
- (void)BA_setNavbarBackgroundHidden:(BOOL)hidden;

/*!
 *  开启樱花动画（CAEmitterLayer动画）
 */
- (void)BA_starYingHuaCoreAnimation;

/*!
 *  开启雪花动画（CADisplayLink动画）
 */
- (void)BA_starXueHuaCoreAnimation;

/*!
 *  暂停雪花动画
 */
- (void)BA_stopXueHuaCoreAnimation;

@end
