//
//  DemoVC15Cell.m
//  demoTest
//
//  Created by 博爱 on 16/4/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC15Cell.h"
#import "DemoVC15_ViewModel.h"
#import "DemoVC15Model.h"
#import "DemoVC7_replyVC.h"

@implementation DemoVC15Cell
{
    UIImageView    *userImageView;
    UILabel        *userNameLabel;
    UIImageView    *starImageView;
    UIButton       *addFriendButton;
    UILabel        *timeLabel;
    UILabel        *contentLabel;
    BACustomButton *supprotButton;
    BACustomButton *replyButton;
    UIImageView    *vlineImageView;
}

// 注意：cell是用initWithStyle初始化

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // 添加所有子控件
        [self setUpAllChildView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    userImageView = [UIImageView new];
    userImageView.layer.masksToBounds = YES;
    userImageView.layer.cornerRadius = 40/2;
    
    userNameLabel = [UILabel new];
    userNameLabel.font = BA_FontSize(13);
    
    starImageView = [UIImageView new];
    
    addFriendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addFriendButton.backgroundColor = BA_NaviBgBlueColor;
    [addFriendButton setTitle:@"加好友" forState:UIControlStateNormal];
    [addFriendButton setTitleColor:BA_White_Color forState:UIControlStateNormal];
    [addFriendButton setImage:[UIImage imageNamed:@"btn_addFriend"] forState:UIControlStateNormal];
    addFriendButton.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 40);
    addFriendButton.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, -15);
    addFriendButton.titleLabel.textAlignment = NSTextAlignmentRight;
    addFriendButton.layer.masksToBounds = YES;
    addFriendButton.layer.cornerRadius = 5.0;
    addFriendButton.titleLabel.font = BA_FontSize(12);
    addFriendButton.tag = 1;
    [addFriendButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    timeLabel = [UILabel new];
    timeLabel.font = BA_FontSize(11);
    timeLabel.textColor = BA_TEXTGrayColor;
    
    contentLabel = [UILabel new];
    contentLabel.font = BA_FontSize(14);
    contentLabel.numberOfLines = 0;
    
    supprotButton = [BACustomButton BA_ShareButton];
    [supprotButton setTitle:@"888" forState:UIControlStateNormal];
    [supprotButton setTitleColor:BA_NaviBgBlueColor forState:UIControlStateNormal];
    supprotButton.titleLabel.font = BA_FontSize(12);
    supprotButton.tag = 2;
    [supprotButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [supprotButton setImage:[UIImage imageNamed:@"btn_support2"] forState:UIControlStateNormal];
    supprotButton.titleLabel.textAlignment = NSTextAlignmentRight;
    
    vlineImageView = [UIImageView new];
    vlineImageView.image = [UIImage imageNamed:@"vline"];
    
    replyButton = [BACustomButton BA_ShareButton];
    [replyButton setTitle:@"回复" forState:UIControlStateNormal];
    [replyButton setTitleColor:BA_NaviBgBlueColor forState:UIControlStateNormal];
    replyButton.titleLabel.font = BA_FontSize(12);
    replyButton.tag = 3;
    [replyButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [replyButton setImage:[UIImage imageNamed:@"btn_reply"] forState:UIControlStateNormal];
    replyButton.titleLabel.textAlignment = NSTextAlignmentRight;
    
    NSArray *views = @[userImageView, userNameLabel, starImageView, addFriendButton, timeLabel, contentLabel, supprotButton, vlineImageView, replyButton];
    [self.contentView BA_AddSubViewsWithArray:views];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil)
    {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

- (IBAction)clickButton:(UIButton *)sender
{
    if (sender.tag == 3)
    {
        DemoVC7_replyVC *replyVC = [[DemoVC7_replyVC alloc] init];
        replyVC.quesstionDataModel = _subViewFrame.model;
        [[self getCurrentViewController].navigationController pushViewController:replyVC animated:YES];
    }
    else if (sender.tag == 2)
    {
        static int number = 0;
        number++;
        [supprotButton setTitle:[NSString stringWithFormat:@"%d", [_subViewFrame.model.supportNumber intValue] + number] forState:UIControlStateNormal];
    }
    else
    {
        NSLog(@"温馨提示：点击了%ld个button!", (long)sender.tag);
    }
}

/*
 问题：
 1.cell的高度应该提前计算出来
 2.cell的高度必须要先计算出每个子控件的frame，才能确定
 3.如果在cell的setStatus方法计算子控件的位置，会比较耗性能
 
 解决:MVVM思想
 M:模型
 V:视图
 VM:视图模型（模型包装视图模型，模型+模型对应视图的frame）
 */
- (void)setSubViewFrame:(DemoVC15_ViewModel *)subViewFrame
{
    _subViewFrame = subViewFrame;
    
    // 设置frame
    [self setUpFrame];
    // 设置data
    [self setUpData];
}

- (void)setUpData
{
    DemoVC15Model *model = _subViewFrame.model;
    
    userImageView.image = [UIImage imageNamed:model.imageName];
    userNameLabel.text = model.userName;
    starImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"star%@", model.starNumber]];
    timeLabel.text     = model.time;
    contentLabel.text  = model.content;
    [supprotButton setTitle:model.supportNumber forState:UIControlStateNormal];
}

- (void)setUpFrame
{
    userImageView.frame = _subViewFrame.imageNameFrame;
    userNameLabel.frame = _subViewFrame.userNameFrame;
    starImageView.frame = _subViewFrame.starNumberFrame;
    addFriendButton.frame = _subViewFrame.addFriendButtonFrame;
    timeLabel.frame     = _subViewFrame.timeFrame;
    contentLabel.frame  = _subViewFrame.contentFrame;
    replyButton.frame   = _subViewFrame.replyButtonFrame;
    vlineImageView.frame= _subViewFrame.vlineImageViewFrame;
    supprotButton.frame = _subViewFrame.supportNumberFrame;
    
    
}

@end
