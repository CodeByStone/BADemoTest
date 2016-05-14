//
//  UIDevice+WF.h
//  MVPlayer
//
//  Created by xuzili on 15/11/23.
//  Copyright © 2015年 Nanguang Culture Communication(Guangzhou) Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (WF)
/**
 *  强制旋转设备
 *  @param  旋转方向
 */
+ (void)setOrientation:(UIInterfaceOrientation)orientation;
@end
