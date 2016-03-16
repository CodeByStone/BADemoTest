//
//  DemoVC5Model.m
//  demoTest
//
//  Created by 博爱 on 16/3/16.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC5Model.h"

@implementation DemoVC5Model

@end

@implementation DemoVC5ModelData : NSObject

+ (NSDictionary *)objectClassInArray{
    return @{@"reviews" : [Reviews class]};
}

@end


@implementation Reviews

@end


@implementation Author

@end


@implementation Page

@end
