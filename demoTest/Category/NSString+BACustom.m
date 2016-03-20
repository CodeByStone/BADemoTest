//
//  NSString+BACustom.m
//  BADemoTest
//
//  Created by 博爱之家 on 16/3/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "NSString+BACustom.h"
#import "NSNumber+BACustom.h"

@implementation NSString (BACustom)


#pragma mark - 获得系统当前日期和时间
+ (nullable NSString *)getCurrentDateAndTime
{
    //获得系统日期
    NSDate *senddate = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *morelocationString = [dateformatter stringFromDate:senddate];
    NSLog(@"当前日期为：%@", morelocationString);
    
    return morelocationString;
}

#pragma mark - 时间戳转换
#pragma mark 时间戳转换【YYYY-MM-dd HH:mm:ss】
+ (nullable NSString *)getCurrentDateAndTimeWithTimeString:(nullable NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];

    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[string intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

#pragma mark 时间戳转换【YYYY-MM-dd】
+ (nullable NSString *)getDateWithTimeString:(nullable NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[string intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

#pragma mark 时间戳转换【HH:mm】
+ (nullable NSString *)getTimeWithTimeString:(nullable NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH:mm"];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    // 时间戳转换
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[string intValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

#pragma mark 时间转换时间戳
+ (nullable NSString *)getTimeStamp
{
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    // 时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
}

- (nullable NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

- (NSNumber *)numberValue
{
    return [NSNumber numberWithString:self];
}

- (NSData *)dataValue
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)stringNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    if (!str) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
        str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    }
    return str;
}

//+ (NSMutableAttributedString *)getColorWithLabel:(UILabel *)label WithString:(NSString *)string andColor:(UIColor *)color
//{
//    NSMutableAttributedString *colorString = [[NSMutableAttributedString alloc] initWithString:string];
//    [colorString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0,string.length)];
//    label.lineBreakMode = NSLineBreakByWordWrapping;
//    
//    return colorString;
//}


@end
