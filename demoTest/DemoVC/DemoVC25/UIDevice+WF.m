//
//  UIDevice+WF.m
//  MVPlayer
//
//  Created by xuzili on 15/11/23.
//  Copyright © 2015年 Nanguang Culture Communication(Guangzhou) Limited. All rights reserved.
//

#import "UIDevice+WF.h"

@implementation UIDevice (WF)

//调用私有方法实现
+ (void)setOrientation:(UIInterfaceOrientation)orientation
{
    SEL selector = NSSelectorFromString(@"setOrientation:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:[self currentDevice]];
    int val = orientation;
    [invocation setArgument:&val atIndex:2];
    [invocation invoke];
    
}
@end
