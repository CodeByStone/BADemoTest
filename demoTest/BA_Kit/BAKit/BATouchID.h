//
//  BATouchID.h
//  demoTest
//
//  Created by 博爱 on 16/3/31.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TouchIDResult)
{
    TouchIDResultSuccess = 0,
    TouchIDResultError,
    TouchIDResultAuthenticationFailed,
    TouchIDResultUserCancel,
    TouchIDResultUserFallback,
    TouchIDResultSystemCancel,
    TouchIDResultPasscodeNotSet,
    TouchIDResultNotAvailable,
    TouchIDResultNotEnrolled
} NS_ENUM_AVAILABLE_IOS(8_0);

NS_CLASS_AVAILABLE_IOS(8_0) @interface BATouchID : NSObject

/**
 *  显示TouchID警示
 */
+ (void)showTouchIDAuthenticationWithReason:(NSString *)reason
                                 completion:(void (^)(TouchIDResult result))completion;
@end
