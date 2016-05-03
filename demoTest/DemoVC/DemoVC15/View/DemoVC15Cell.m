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

@interface DemoVC15Cell ()

@property(nonatomic, strong) UIImageView    *userImageView;
@property(nonatomic, strong) UILabel        *userNameLabel;
@property(nonatomic, strong) UIImageView    *starImageView;
@property(nonatomic, strong) UIButton       *addFriendButton;
@property(nonatomic, strong) UILabel        *timeLabel;
@property(nonatomic, strong) UILabel        *contentLabel;
@property(nonatomic, strong) BACustomButton *supprotButton;
@property(nonatomic, strong) BACustomButton *replyButton;
@property(nonatomic, strong) UIImageView    *vlineImageView;

@end

@implementation DemoVC15Cell

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
    _userImageView = [UIImageView new];
    _userImageView.layer.masksToBounds = YES;
    _userImageView.layer.cornerRadius = 40/2;
    
    _userNameLabel = [UILabel new];
    _userNameLabel.font = BA_FontSize(13);
    
    _starImageView = [UIImageView new];
    
    _addFriendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _addFriendButton.backgroundColor = BA_NaviBgBlueColor;
    [_addFriendButton setTitle:@"加好友" forState:UIControlStateNormal];
    [_addFriendButton setTitleColor:BA_White_Color forState:UIControlStateNormal];
    [_addFriendButton setImage:[UIImage imageNamed:@"btn_addFriend"] forState:UIControlStateNormal];
    _addFriendButton.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 40);
    _addFriendButton.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, -15);
    _addFriendButton.titleLabel.textAlignment = NSTextAlignmentRight;
    _addFriendButton.layer.masksToBounds = YES;
    _addFriendButton.layer.cornerRadius = 5.0;
    _addFriendButton.titleLabel.font = BA_FontSize(12);
    _addFriendButton.tag = 1;
    [_addFriendButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _timeLabel = [UILabel new];
    _timeLabel.font = BA_FontSize(11);
    _timeLabel.textColor = BA_TEXTGrayColor;
    
    _contentLabel = [UILabel new];
    _contentLabel.font = BA_FontSize(14);
    _contentLabel.numberOfLines = 0;
    
    _supprotButton = [BACustomButton BA_ShareButton];
    [_supprotButton setTitle:@"888" forState:UIControlStateNormal];
    [_supprotButton setTitleColor:BA_NaviBgBlueColor forState:UIControlStateNormal];
    _supprotButton.titleLabel.font = BA_FontSize(12);
    _supprotButton.tag = 2;
    [_supprotButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [_supprotButton setImage:[UIImage imageNamed:@"btn_support2"] forState:UIControlStateNormal];
    _supprotButton.titleLabel.textAlignment = NSTextAlignmentRight;
    
    _vlineImageView = [UIImageView new];
    _vlineImageView.image = [UIImage imageNamed:@"vline"];
    
    _replyButton = [BACustomButton BA_ShareButton];
    [_replyButton setTitle:@"回复" forState:UIControlStateNormal];
    [_replyButton setTitleColor:BA_NaviBgBlueColor forState:UIControlStateNormal];
    _replyButton.titleLabel.font = BA_FontSize(12);
    _replyButton.tag = 3;
    [_replyButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [_replyButton setImage:[UIImage imageNamed:@"btn_reply"] forState:UIControlStateNormal];
    _replyButton.titleLabel.textAlignment = NSTextAlignmentRight;
    
    NSArray *views = @[_userImageView, _userNameLabel, _starImageView, _addFriendButton, _timeLabel, _contentLabel, _supprotButton, _vlineImageView, _replyButton];
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
        [_supprotButton setTitle:[NSString stringWithFormat:@"%d", [_subViewFrame.model.supportNumber intValue] + number] forState:UIControlStateNormal];
    }
    else
    {
        BALog(@"温馨提示：点击了%ld个button!", (long)sender.tag);
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
    
    self.userImageView.image = [UIImage imageNamed:model.imageName];
    self.userNameLabel.text = model.userName;
    self.starImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"star%@", model.starNumber]];
    self.timeLabel.text     = model.time;
    self.contentLabel.text  = model.content;
    [self.supprotButton setTitle:model.supportNumber forState:UIControlStateNormal];
}

- (void)setUpFrame
{
    _userImageView.frame = _subViewFrame.imageNameFrame;
    _userNameLabel.frame = _subViewFrame.userNameFrame;
    _starImageView.frame = _subViewFrame.starNumberFrame;
    _addFriendButton.frame = _subViewFrame.addFriendButtonFrame;
    _timeLabel.frame     = _subViewFrame.timeFrame;
    _contentLabel.frame  = _subViewFrame.contentFrame;
    _replyButton.frame   = _subViewFrame.replyButtonFrame;
    _vlineImageView.frame= _subViewFrame.vlineImageViewFrame;
    _supprotButton.frame = _subViewFrame.supportNumberFrame;
}

@end
