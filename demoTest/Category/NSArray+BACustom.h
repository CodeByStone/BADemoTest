//
//  NSArray+BACustom.h
//  demoTest
//
//  Created by 博爱之家 on 16/3/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BACustom)

/**
 *   Returns the object located at a random index.
 *
 *  @return The object in the array with a random index value.
 */
- (nullable id)randomObject;

/**
 *   Returns the object located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 *
 *  @param index The object located at index.
 *
 *  @return Returns the object located at index, or return nil when out of bounds.
 It's similar to `objectAtIndex:`, but it never throw exception.
 */
- (nullable id)objectOrNilAtIndex:(NSUInteger)index;


@end
