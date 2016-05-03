//
//  DemoVC15Cell.h
//  demoTest
//
//  Created by 博爱 on 16/4/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoVC15_ViewModel;
@interface DemoVC15Cell : UITableViewCell

@property (nonatomic, strong) DemoVC15_ViewModel *subViewFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
