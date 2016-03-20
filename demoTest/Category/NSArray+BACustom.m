//
//  NSArray+BACustom.m
//  demoTest
//
//  Created by 博爱之家 on 16/3/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "NSArray+BACustom.h"

@implementation NSArray (BACustom)

- (id)randomObject
{
    if (self.count)
    {
        return self[arc4random_uniform((u_int32_t)self.count)];
    }
    return nil;
}

@end
