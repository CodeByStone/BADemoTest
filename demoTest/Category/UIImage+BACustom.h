//
//  UIImage+BACustom.h
//  demoTest
//
//  Created by 博爱之家 on 16/3/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BACustom)

/**
 *   Create an animated image with GIF data. After created, you can access
 the images via property '.images'. If the data is not animated gif, this
 function is same as [UIImage imageWithData:data scale:scale];
 *
 *  @param data  GIF data.
 *  @param scale The scale factor
 *
 *  @return A new image created from GIF, or nil when an error occurs.
 */
+ (nullable UIImage *)imageWithSmallGIFData:(nonnull NSData *)data scale:(CGFloat)scale;

@end
