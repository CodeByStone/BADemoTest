//
//  YRDemandUserViewCell.m
//  yrapp
//
//  Created by 博爱 on 16/3/4.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import "YRDemandUserViewCell.h"

@implementation YRDemandUserViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    self.userImageView = [UIImageView new];
    self.userImageView.frame = CGRectMake(20, 5, 50, 50);
    self.userImageView.image = [UIImage imageNamed:@"005.jpg"];
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 50/2;
    self.userImageView.layer.borderWidth = 1.0f;
    self.userImageView.layer.borderColor = NaviBgBlueColor.CGColor;
    
    self.userNameLabel = [UILabel new];
    self.userNameLabel.frame = CGRectMake(CGRectGetMaxX(self.userImageView.frame) + 10, 5, KSCREEN_WIDTH - 60, 20);
    self.userNameLabel.text = @"博爱";
    
    self.userInfoLabel = [[UILabel alloc] init];
    self.userInfoLabel.frame = CGRectMake(CGRectGetMinX(self.userNameLabel.frame), CGRectGetMaxY(self.userNameLabel.frame), KSCREEN_WIDTH - 60, 20);
    self.userInfoLabel.textAlignment = NSTextAlignmentLeft;
    self.userInfoLabel.textColor = kTEXTGrayColor;
    self.userInfoLabel.lineBreakMode = NSLineBreakByTruncatingHead;
    self.userInfoLabel.font = [UIFont systemFontOfSize:14];
    self.userInfoLabel.numberOfLines = 0;
    self.userInfoLabel.text = @"1广发教你如何止损 2广发教你如何止损 3广发教你如何止损4广发教你如何止损 5广发教你如何止损 6广发教你如何止损 ";
    
    self.attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.attentionButton.frame = CGRectMake(CGRectGetMinX(self.userNameLabel.frame), CGRectGetMaxY(self.userInfoLabel.frame)+5, 60, 25);

    self.attentionButton.backgroundColor = NaviBgBlueColor;
    [self.attentionButton setTitle:@"关注" forState:UIControlStateNormal];
    [self.attentionButton setTintColor:kWHITECOLOR];
    self.attentionButton.layer.masksToBounds = YES;
    self.attentionButton.layer.cornerRadius = 5.0f;

    [self addSubview:self.userImageView];
    [self addSubview:self.userNameLabel];
    [self addSubview:self.userInfoLabel];
    [self addSubview:self.attentionButton];
    
//    userImageView.sd_layout
//    .leftSpaceToView(self, 10)
//    .topSpaceToView(self.contentView, 5)
//    .widthIs(50)
//    .heightIs(50);
//    
//    nameLabel.sd_layout
//    .leftSpaceToView(userImageView, 5)
//    .topEqualToView(userImageView)
//    .rightSpaceToView(self, 10)
//    .heightIs(20);
//    
//    contentLabel.sd_layout
//    .leftEqualToView(nameLabel)
//    .topSpaceToView(nameLabel, 0)
//    .rightSpaceToView(self, 10)
//    .heightIs(20);
//    
//    attionBtn.sd_layout
//    .leftEqualToView(nameLabel)
//    .topSpaceToView(contentLabel, 5)
//    .widthIs(60)
//    .heightIs(25);
}

- (void)setDemandDataModel:(YRDemandModelAuthor *)demandDataModel
{
    _demandDataModel = demandDataModel;
    
    NSString *myPhotoURL = demandDataModel.headImg;
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:myPhotoURL] placeholderImage:[UIImage imageNamed:@"005.jpg"] options:0];
    self.userNameLabel.text = demandDataModel.nickName;
    self.userInfoLabel.text = demandDataModel.desc;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
