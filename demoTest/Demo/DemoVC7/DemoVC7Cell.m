//
//  DemoVC7Cell.m
//  demoTest
//
//  Created by 博爱 on 16/3/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC7Cell.h"
#import "DemoVC7Model.h"
#import "DemoVC7_replyVC.h"

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
    
    supprotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [supprotButton setTitle:@"888" forState:UIControlStateNormal];
    [supprotButton setTitleColor:BA_NaviBgBlueColor forState:UIControlStateNormal];
    supprotButton.titleLabel.font = BA_FontSize(12);
    supprotButton.tag = 2;
    [supprotButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [supprotButton setImage:[UIImage imageNamed:@"btn_support2"] forState:UIControlStateNormal];
    supprotButton.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, supprotButton.titleLabel.width+5);
    supprotButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    supprotButton.titleLabel.textAlignment = NSTextAlignmentRight;

    vlineImageView = [UIImageView new];
    vlineImageView.image = [UIImage imageNamed:@"vline"];
    
    replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [replyButton setTitle:@"回复" forState:UIControlStateNormal];
    [replyButton setTitleColor:BA_NaviBgBlueColor forState:UIControlStateNormal];
    replyButton.titleLabel.font = BA_FontSize(12);
    replyButton.tag = 3;
    [replyButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [replyButton setImage:[UIImage imageNamed:@"btn_reply"] forState:UIControlStateNormal];
    replyButton.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 30);
    replyButton.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, -15);
    replyButton.titleLabel.textAlignment = NSTextAlignmentRight;
    
    NSArray *views = @[userImageView, userNameLabel, starImageView, addFriendButton, timeLabel, contentLabel, supprotButton, vlineImageView, replyButton];
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
    
    starImageView.sd_layout
    .leftSpaceToView(userNameLabel, margin)
    .topEqualToView(userNameLabel)
    .widthIs(80)
    .heightIs(20);
    
    addFriendButton.sd_layout
    .rightSpaceToView(contentView, margin)
    .topEqualToView(userImageView)
    .widthIs(65)
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
    .widthIs(70)
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
    
    if (sender.tag == 3)
    {
        DemoVC7_replyVC *replyVC = [[DemoVC7_replyVC alloc] init];
        replyVC.quesstionDataModel = self.model;
        replyVC.title = [NSString stringWithFormat:@"回复%@的评论", replyVC.quesstionDataModel.userName7];
        [[self viewController].navigationController pushViewController:replyVC animated:YES];
    }
    else if (sender.tag == 2)
    {
        static int number = 0;
        number++;
        [supprotButton setTitle:[NSString stringWithFormat:@"%d", [self.model.supportNumber7 intValue] + number] forState:UIControlStateNormal];
    }
    else
    {
        NSLog(@"温馨提示：点击了%ld个button!", (long)sender.tag);
    }
}

#pragma mark - *****  调用view的C
- (UIViewController *)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
