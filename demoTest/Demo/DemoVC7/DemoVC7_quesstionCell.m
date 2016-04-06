//
//  DemoVC7_quesstionCell.m
//  demoTest
//
//  Created by 博爱 on 16/3/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC7_quesstionCell.h"
#import "DemoVC7Model.h"

@implementation DemoVC7_quesstionCell
{
    UIImageView    *userImageView;
    UILabel        *userNameLabel;
    UILabel        *timeLabel;
    UILabel        *contentLabel;
    UIImageView    *hlineImageView;

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
    
    timeLabel = [UILabel new];
    timeLabel.font = BA_FontSize(11);
    timeLabel.textColor = BA_TEXTGrayColor;
    
    contentLabel = [UILabel new];
    contentLabel.font = BA_FontSize(14);
    
    hlineImageView = [UIImageView new];
    hlineImageView.image = [UIImage imageNamed:@"hline"];
    
    NSArray *views = @[userImageView, userNameLabel, timeLabel, contentLabel, hlineImageView];
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
    
    hlineImageView.sd_layout
    .leftSpaceToView(contentView, 0)
    .rightSpaceToView(contentView, 0)
    .topSpaceToView(contentLabel, margin)
    .heightIs(1);
    
    [self setupAutoHeightWithBottomView:hlineImageView bottomMargin:0];
}

- (void)setModel:(DemoVC7Model *)model
{
    _model = model;
    
    userImageView.image = [UIImage imageNamed:model.imageName];
    userNameLabel.text = model.userName;
    timeLabel.text = model.time;
    contentLabel.text = model.content;
}

- (IBAction)clickButton:(UIButton *)sender
{
    NSLog(@"温馨提示：点击了%ld个button!", (long)sender.tag);
}


@end
