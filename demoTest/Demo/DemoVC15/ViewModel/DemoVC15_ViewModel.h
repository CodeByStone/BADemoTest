//
//  DemoVC15_ViewModel.h
//  demoTest
//
//  Created by 博爱 on 16/4/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BABaseViewModel.h"

@class DemoVC15Model;
@interface DemoVC15_ViewModel : BABaseViewModel

// model来源
@property (nonatomic, strong) DemoVC15Model *model;

// 头像Frame
@property (nonatomic, assign) CGRect imageNameFrame;
// 用户名Frame
@property (nonatomic, assign) CGRect userNameFrame;
// 时间Frame
@property (nonatomic, assign) CGRect timeFrame;
// 文字内容Frame
@property (nonatomic, assign) CGRect contentFrame;
// 星星Frame
@property (nonatomic, assign) CGRect starNumberFrame;
// 点赞数Frame
@property (nonatomic, assign) CGRect supportNumberFrame;
// 加好友Frame
@property (nonatomic, assign) CGRect addFriendButtonFrame;
// vlineImageViewFrame
@property (nonatomic, assign) CGRect vlineImageViewFrame;
// 回复Frame
@property (nonatomic, assign) CGRect replyButtonFrame;


// cell的高度
@property (nonatomic, assign) CGFloat cellHeight;


@end
