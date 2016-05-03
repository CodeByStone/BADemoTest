//
//  BAChineseString.h
//  demoTest
//
//  Created by 博爱 on 16/4/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pinyin.h"

@interface BAChineseString : NSObject

@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSString *pinYin;

/*!
 *  返回排序后的tableview右边的索引indexArray
 *
 *  @param stringArr stringArr
 *
 *  @return 返回排序后的tableview右边的索引indexArray
 */
+ (NSMutableArray *)BA_IndexArray:(NSArray*)stringArr;

/*!
 *  返回排序后的联系人数组
 *
 *  @param stringArr stringArr
 *
 *  @return 返回排序后的联系人数组
 */
+ (NSMutableArray *)BA_LetterSortArray:(NSArray*)stringArr;

/*!
 *  返回一组字母排序数组(中英混排)
 *
 *  @param stringArr stringArr
 *
 *  @return 返回一组字母排序数组(中英混排)
 */
+ (NSMutableArray *)BA_SortArray:(NSArray*)stringArr;

@end