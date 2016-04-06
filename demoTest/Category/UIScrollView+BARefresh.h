//
//  UIScrollView+BARefresh.h
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIScrollView (BARefresh)

/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock;

/** 开始头部刷新 */
- (void)beginHeaderRefresh;

/** 结束头部刷新 */
- (void)endHeaderRefresh;

/** 添加底部刷新 */
- (void)addFooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock;

/** 开始底部刷新 */
- (void)beginFooterRefresh;

/** 结束底部刷新 */
- (void)endFooterRefresh;


@end
