//
//  UIScrollView+BARefresh.m
//  BABaseProject
//
//  Created by apple on 16/1/13.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "UIScrollView+BARefresh.h"

@implementation UIScrollView (BARefresh)


/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock
{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshBlock];
}

/** 开始头部刷新 */
- (void)beginHeaderRefresh
{
    [self.mj_header beginRefreshing];
}

/** 结束头部刷新 */
- (void)endHeaderRefresh
{
    [self.mj_header endRefreshing];
}

/** 添加底部刷新 */
- (void)addFooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock
{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshBlock];
}

/** 开始底部刷新 */
- (void)beginFooterRefresh
{
    [self.mj_footer beginRefreshing];
}

/** 结束底部刷新 */
- (void)endFooterRefresh
{
    [self.mj_footer endRefreshing];
}




@end
