//
//  DemoVC17Header.m
//  demoTest
//
//  Created by 博爱 on 16/4/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC17Header.h"

@implementation DemoVC17Header
{
    CGRect   initFrame;
    CGFloat  defaultViewHeight;
    CGRect   subViewsFrame;
}

- (void)initWithTableView:(UITableView *)tableView andBackGroundView:(UIView *)bgImageView andSubviews:(UIView *)userImageView
{
    _tableView = tableView;
    _bigImageView = bgImageView;
    _userImageView = userImageView;
    
    initFrame = _bigImageView.frame;
    defaultViewHeight = initFrame.size.height;
    subViewsFrame = _userImageView.frame;
    
    [_userImageView setCornerRadius:_userImageView.width/2];
    
    UIView *headerView = [[UIView alloc] initWithFrame:initFrame];
    self.tableView.tableHeaderView = headerView;
    
    [_tableView addSubview:_bigImageView];
    [_tableView addSubview:_userImageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect frame = _bigImageView.frame;
    frame.size.width = _tableView.frame.size.width;
    _bigImageView.frame  = frame;
    
    if (scrollView.contentOffset.y < 0)
    {
        CGFloat offset = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
        
        initFrame.origin.x = - offset /2;
        initFrame.origin.y = - offset;
        initFrame.size.width = _tableView.frame.size.width+offset;
        initFrame.size.height = defaultViewHeight+offset;
        _bigImageView.frame = initFrame;
        
        [self viewDidLayoutSubViews:offset/2];
    }
}

- (void)viewDidLayoutSubViews:(CGFloat)offset
{
    _userImageView.frame = CGRectMake(0, 0, 80+offset, 80+offset);
    _userImageView.center = CGPointMake(_bigImageView.center.x, _bigImageView.center.y);
    [_userImageView setCornerRadius:_userImageView.width/2];
}

- (void)resizeView
{
    initFrame.size.width = _tableView.width;
    _bigImageView.frame = initFrame;
}


@end
