//
//  DemoVC2Cell.h
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoVC2Model;
@interface DemoVC2Cell : UITableViewCell

@property (nonatomic, strong) DemoVC2Model  *model;

@property (nonatomic, strong) NSIndexPath   *indexPath;

@property (nonatomic, copy) void (^moreButtonClickedBlock)(NSIndexPath *indexPath);

@end
