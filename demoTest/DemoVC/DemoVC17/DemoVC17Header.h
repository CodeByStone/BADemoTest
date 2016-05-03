//
//  DemoVC17Header.h
//  demoTest
//
//  Created by 博爱 on 16/4/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoVC17Header : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView      *bigImageView;
@property (nonatomic, strong) UIView      *userImageView;

- (void)initWithTableView:(UITableView *)tableView andBackGroundView:(UIView *)bgImageView andSubviews:(UIView *)userImageView;

- (void)scrollViewDidScroll:(UIScrollView*)scrollView;

- (void)resizeView;

@end
