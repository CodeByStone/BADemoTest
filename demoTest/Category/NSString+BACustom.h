//
//  NSString+BACustom.h
//  BADemoTest
//
//  Created by 博爱之家 on 16/3/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BACustom)

/**
 *  获得系统当前日期和时间
 *
 *  @return 获得系统当前日期和时间
 */
+ (nullable NSString *)getCurrentDateAndTime;

/**
 *  时间戳转换【YYYY-MM-dd HH:mm:ss】
 *
 *  @param string 时间戳
 *
 *  @return 时间戳转换【YYYY-MM-dd HH:mm:ss】
 */
+ (nullable NSString *)getCurrentDateAndTimeWithTimeString:(nullable NSString *)string;

/**
 *  时间戳转换【YYYY-MM-dd】
 *
 *  @param string 时间戳
 *
 *  @return 时间戳转换【YYYY-MM-dd】
 */
+ (nullable NSString *)getDateWithTimeString:(nullable NSString *)string;

/**
 *  时间戳转换【HH:mm】
 *
 *  @param string 时间戳
 *
 *  @return 时间戳转换【HH:mm】
 */
+ (nullable NSString *)getTimeWithTimeString:(nullable NSString *)string;

/**
 *  时间转换时间戳
 *
 *  @param string 时间
 *
 *  @return 时间转换时间戳
 */
+ (nullable NSString *)getTimeStamp;

/**
 *   Trim blank characters (space and newline) in head and tail.
 *
 *  @return the trimmed string.
 */
- (nullable NSString *)stringByTrim;

/**
 *   Try to parse this string and returns an `NSNumber`.
 *
 *  @return Returns an `NSNumber` if parse succeed, or nil if an error occurs.
 */
- (nullable NSNumber *)numberValue;

/**
 *  Returns an NSData using UTF-8 encoding.
 *
 *  @return Returns an NSData using UTF-8 encoding.
 */
- (nullable NSData *)dataValue;

/**
 *   Create a string from the file in main bundle (similar to [UIImage imageNamed:]).
 *
 *  @param name The file name (in main bundle).
 *
 *  @return A new string create from the file in UTF-8 character encoding.
 */
+ (nullable NSString *)stringNamed:(nullable NSString *)name;

/**
 *   Returns a lowercase NSString for md5 hash.
 *
 *  @return  Returns a lowercase NSString for md5 hash.
 */
- (nullable NSString *)md5String;

/**
 *   Returns a lowercase NSString for hmac using algorithm md5 with key.
 *
 *  @param key The hmac key.
 *
 *  @return  Returns a lowercase NSString for hmac using algorithm md5 with key.
 */
- (nullable NSString *)hmacMD5StringWithKey:(nullable NSString *)key;



//+ (NSString *)getColorWithLabel:(UILabel *)label WithString:(NSString *)string andColor:(UIColor *)color;




@end
