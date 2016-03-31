//
//  DemoVC3Cell.h
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DemoVC3Model;
@interface DemoVC3Cell : UITableViewCell

@property (nonatomic, strong) DemoVC3Model *model;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, copy) void (^moreButtonClickBlock)(NSIndexPath *indexPath);


@end
