//
//  DemoVC7Cell.m
//  demoTest
//
//  Created by 博爱 on 16/3/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC7Cell.h"
#import "DemoVC7Model.h"

@implementation DemoVC7Cell
{
    UIImageView    *userImageView;
    UILabel        *userNameLabel;
    UIImageView    *starImageView;
    UIButton       *addFriendButton;
    UILabel        *timeLabel;
    UILabel        *contentLabel;
    UIButton       *supprotButton;
    UIButton       *replyButton;
    UIImageView    *vlineImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self createCellView];
    }
    return self;
}

-(void)createCellView
{
    userImageView = [UIImageView new];
    userImageView.layer.masksToBounds = YES;
    userImageView.layer.cornerRadius = 50/2;
    
    userNameLabel = [UILabel new];
    userNameLabel.font = KFontSize(13);
    
    starImageView = [UIImageView new];
    
    addFriendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addFriendButton.backgroundColor = NaviBgBlueColor;
    [addFriendButton setTitle:@"加好友" forState:UIControlStateNormal];
    [addFriendButton setTitleColor:kWHITECOLOR forState:UIControlStateNormal];
    addFriendButton.layer.masksToBounds = YES;
    addFriendButton.layer.cornerRadius = 5.0;
    addFriendButton.titleLabel.font = KFontSize(12);
    addFriendButton.tag = 1;
    [addFriendButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

    
    timeLabel = [UILabel new];
    timeLabel.font = KFontSize(11);
    timeLabel.textColor = kTEXTGrayColor;
    
    contentLabel = [UILabel new];
    contentLabel.font = KFontSize(14);
    contentLabel.textColor = kTEXTGrayColor;
    
    supprotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [supprotButton setTitle:@"888" forState:UIControlStateNormal];
    [supprotButton setTitleColor:NaviBgBlueColor forState:UIControlStateNormal];
    supprotButton.titleLabel.font = KFontSize(12);
    supprotButton.tag = 2;
    [supprotButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

    vlineImageView = [UIImageView new];
    vlineImageView.image = [UIImage imageNamed:@"vline"];
    
    replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [replyButton setTitle:@"回复" forState:UIControlStateNormal];
    [replyButton setTitleColor:NaviBgBlueColor forState:UIControlStateNormal];
    replyButton.titleLabel.font = KFontSize(12);
    replyButton.tag = 3;
    [replyButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *views = @[userImageView, userNameLabel, starImageView, addFriendButton, timeLabel, contentLabel, supprotButton, vlineImageView, replyButton];
    [views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.contentView addSubview:obj];
    }];
    
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    
    userImageView.sd_layout
    .leftSpaceToView(contentView, margin)
    .topSpaceToView(contentView, margin)
    .widthIs(50)
    .heightIs(50);
    
    userNameLabel.sd_layout
    .leftSpaceToView(userImageView, margin)
    .topEqualToView(userImageView)
    .heightIs(20);
    [userNameLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    starImageView.sd_layout
    .leftSpaceToView(userNameLabel, margin)
    .topEqualToView(userNameLabel)
    .widthIs(100)
    .heightIs(20);
    
    addFriendButton.sd_layout
    .rightSpaceToView(contentView, margin)
    .topEqualToView(userImageView)
    .widthIs(50)
    .heightIs(20);
    
    timeLabel.sd_layout
    .leftEqualToView(userNameLabel)
    .topSpaceToView(userNameLabel, 0)
    .heightIs(15);
    [timeLabel setSingleLineAutoResizeWithMaxWidth:120];
    
    contentLabel.sd_layout
    .leftEqualToView(userNameLabel)
    .topSpaceToView(timeLabel, 5)
    .rightSpaceToView(contentView, margin)
    .autoHeightRatio(0);
    
    replyButton.sd_layout
    .rightSpaceToView(contentView, margin)
    .topSpaceToView(contentLabel, margin)
    .widthIs(50)
    .heightIs(15);
    
    vlineImageView.sd_layout
    .rightSpaceToView(replyButton, 3)
    .topEqualToView(replyButton)
    .heightIs(15)
    .widthIs(1);
    
    supprotButton.sd_layout
    .rightSpaceToView(vlineImageView, 3)
    .topSpaceToView(contentLabel, margin)
    .widthIs(50)
    .heightIs(15);
    
    [self setupAutoHeightWithBottomView:supprotButton bottomMargin:margin];
}

- (void)setModel:(DemoVC7Model *)model
{
    _model = model;
    
    userImageView.image = [UIImage imageNamed:model.icon7];
    userNameLabel.text = model.userName7;
    starImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"star%@", model.starNumber7]];
    timeLabel.text = model.time7;
    contentLabel.text = model.content7;
    [supprotButton setTitle:model.supportNumber7 forState:UIControlStateNormal];
}

- (IBAction)clickButton:(UIButton *)sender
{
    NSLog(@"温馨提示：点击了%ld个button!", (long)sender.tag);
}

@end
