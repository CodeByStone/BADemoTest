//
//  DemoVC10Cell.h
//  demoTest
//
//  Created by 博爱 on 16/3/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoVC10Model.h"

@class DemoVC10_replyCell;
@interface DemoVC10Cell : UITableViewCell
@property (nonatomic, strong) UIButton       *addFriendButton;
@property (nonatomic, strong) UIImageView    *vlineImageView;
@property (nonatomic, strong) DemoVC10Model  *model;

@end

@interface DemoVC10_replyCell : UITableViewCell

@property (nonatomic, strong) DemoVC10Model *model;

@end

@interface DemoVC10_replyVC_replyCell : UITableViewCell

@property (nonatomic, strong) DemoVC10Model *model;

@end
