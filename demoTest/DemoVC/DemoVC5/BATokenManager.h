//
//  BATokenManager.h
//  demoTest
//
//  Created by 博爱 on 16/3/28.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BATokenManager : NSObject
//缓存搜索的数组
+(void)SearchText :(NSString *)seaTxt;
//清除缓存数组
+(void)removeAllArray;
@end
