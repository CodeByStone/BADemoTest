//
//  DemoVC10Cell.m
//  demoTest
//
//  Created by 博爱 on 16/3/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC10Cell.h"

@implementation DemoVC10Cell
{
    UIImageView    *userImageView;
    UILabel        *userNameLabel;
    UILabel        *timeLabel;
    UILabel        *contentLabel;
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
    userImageView.layer.cornerRadius = 40/2;
    
    userNameLabel = [UILabel new];
    userNameLabel.font = KFontSize(13);
    
    self.addFriendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addFriendButton.backgroundColor = NaviBgBlueColor;
    [self.addFriendButton setTitle:@"123" forState:UIControlStateNormal];
    [self.addFriendButton setTitleColor:kWHITECOLOR forState:UIControlStateNormal];
    [self.addFriendButton setImage:[UIImage imageNamed:@"btn_addFriend"] forState:UIControlStateNormal];
    self.addFriendButton.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 40);
    self.addFriendButton.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, -15);
    self.addFriendButton.titleLabel.textAlignment = NSTextAlignmentRight;
    self.addFriendButton.layer.masksToBounds = YES;
    self.addFriendButton.layer.cornerRadius = 5.0;
    self.addFriendButton.titleLabel.font = KFontSize(12);
    self.addFriendButton.tag = 1;
    [self.addFriendButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    timeLabel = [UILabel new];
    timeLabel.font = KFontSize(11);
    timeLabel.textColor = kTEXTGrayColor;
    
    contentLabel = [UILabel new];
    contentLabel.font = KFontSize(14);
    contentLabel.textColor = NaviBgBlueColor;
    
    self.vlineImageView = [UIImageView new];
    self.vlineImageView.image = [UIImage imageNamed:@"vline"];
    
    
    NSArray *views = @[userImageView, userNameLabel, self.addFriendButton, timeLabel, contentLabel, self.vlineImageView];
    [self.contentView BA_AddSubViewsWithArray:views];
    
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    
    userImageView.sd_layout
    .leftSpaceToView(contentView, margin)
    .topSpaceToView(contentView, margin)
    .widthIs(40)
    .heightIs(40);
    
    userNameLabel.sd_layout
    .leftSpaceToView(userImageView, margin)
    .topEqualToView(userImageView)
    .heightIs(20);
    [userNameLabel setSingleLineAutoResizeWithMaxWidth:150];
    
    self.addFriendButton.sd_layout
    .rightSpaceToView(contentView, margin)
    .topEqualToView(userImageView)
    .widthIs(70)
    .heightIs(25);
    
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
    
    self.vlineImageView.sd_layout
    .leftEqualToView(userNameLabel)
    .rightSpaceToView(contentView, margin)
    .topSpaceToView(contentLabel, margin)
    .heightIs(1);
    
    if (self.vlineImageView)
    {
        [self setupAutoHeightWithBottomView:self.vlineImageView bottomMargin:margin];
    }
    else
    {
        [self setupAutoHeightWithBottomView:contentLabel bottomMargin:margin];
    }
}

- (void)setModel:(DemoVC10Model *)model
{
    _model = model;
    
    userImageView.image = [UIImage imageNamed:model.imageName];
    userNameLabel.text = model.userName;
    timeLabel.text = model.time;
    contentLabel.text = model.content;
    [_addFriendButton setTitle:model.commentNumber forState:UIControlStateNormal];
}

//- (void)setModel2:(DemoVC10Model *)model2
//{
//    _model2 = model2;
//    
//    userImageView.image = [UIImage imageNamed:model2.imageName];
//    userNameLabel.text = model2.userName;
//    timeLabel.text = model2.time;
//    contentLabel.text = model2.content;
//}

- (IBAction)clickButton:(UIButton *)sender
{
    NSString *msg = [NSString stringWithFormat:@"温馨提示：点击了%ld个button!", (long)sender.tag];
    [self showAlertView:@"温馨提示：" message:msg];
}

@end

@implementation DemoVC10_replyCell
{
    UIImageView    *userImageView;
    UILabel        *userNameLabel;
    UILabel        *timeLabel;
    UILabel        *contentLabel;
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
    userImageView.layer.cornerRadius = 40/2;
    
    userNameLabel = [UILabel new];
    userNameLabel.font = KFontSize(13);

    timeLabel = [UILabel new];
    timeLabel.font = KFontSize(11);
    timeLabel.textColor = kTEXTGrayColor;
    
    contentLabel = [UILabel new];
    contentLabel.font = KFontSize(14);
    
    NSArray *views = @[userImageView, userNameLabel, timeLabel, contentLabel];
    [self.contentView BA_AddSubViewsWithArray:views];
    
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    
    userImageView.sd_layout
    .leftSpaceToView(contentView, 40+margin*2)
    .topSpaceToView(contentView, margin)
    .widthIs(40)
    .heightIs(40);
    
    userNameLabel.sd_layout
    .leftSpaceToView(userImageView, margin)
    .topEqualToView(userImageView)
    .heightIs(20);
    [userNameLabel setSingleLineAutoResizeWithMaxWidth:150];
    
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
    
    [self setupAutoHeightWithBottomView:contentLabel bottomMargin:margin];
}

- (void)setModel:(DemoVC10Model *)model
{
    _model = model;
    
    userImageView.image = [UIImage imageNamed:model.imageName];
    userNameLabel.text = model.userName;
    timeLabel.text = model.time;
    contentLabel.text = model.content;
}

@end

@implementation DemoVC10_replyVC_replyCell
{
    UIImageView    *userImageView;
    UILabel        *userNameLabel;
    UILabel        *timeLabel;
    UILabel        *contentLabel;
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
    userImageView.layer.cornerRadius = 40/2;
    
    userNameLabel = [UILabel new];
    userNameLabel.font = KFontSize(13);
    
    timeLabel = [UILabel new];
    timeLabel.font = KFontSize(11);
    timeLabel.textColor = kTEXTGrayColor;
    
    contentLabel = [UILabel new];
    contentLabel.font = KFontSize(14);
    
    NSArray *views = @[userImageView, userNameLabel, timeLabel, contentLabel];
    [self.contentView BA_AddSubViewsWithArray:views];
    
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    
    userImageView.sd_layout
    .leftSpaceToView(contentView, margin)
    .topSpaceToView(contentView, margin)
    .widthIs(40)
    .heightIs(40);
    
    userNameLabel.sd_layout
    .leftSpaceToView(userImageView, margin)
    .topEqualToView(userImageView)
    .heightIs(20);
    [userNameLabel setSingleLineAutoResizeWithMaxWidth:150];
    
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
    
    [self setupAutoHeightWithBottomView:contentLabel bottomMargin:margin];
}

- (void)setModel:(DemoVC10Model *)model
{
    _model = model;
    
    userImageView.image = [UIImage imageNamed:model.imageName];
    userNameLabel.text = model.userName;
    timeLabel.text = model.time;
    contentLabel.text = model.content;
}

@end


