//
//  DemoVC10_replyVC.h
//  demoTest
//
//  Created by 博爱 on 16/3/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoVC10Model.h"

@interface DemoVC10_replyVC : UITableViewController

@property (nonatomic, strong) DemoVC10Model *quesstionDataModel;
@property (nonatomic, strong) DemoVC10Model *replyDataModel;

@property (nonatomic, strong) NSMutableArray *replyDataArray;

@end
