//
//  YRDemandShareCell.m
//  yrapp
//
//  Created by 博爱 on 16/3/4.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import "YRDemandShareCell.h"
#import "YRDemandShareModel.h"

@interface YRDemandShareCell ()
{
    UIView *subView;
}

@property (nonatomic, copy) cilckIndexBlock clickIndexBlock;

@end

@implementation YRDemandShareCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addContentView];
    }
    return self;
}

- (void)addContentView
{
    self.collectionBtn = [[BACustomButton alloc] initWitAligenmentStatus:BAAligenmentStatusTop];
    self.collectionBtn.frame = CGRectMake(0, 0, BA_SCREEN_WIDTH/4, 80);
    [self.collectionBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [self.collectionBtn setTitleColor:BA_TEXTGrayColor forState:UIControlStateNormal];
    [self.collectionBtn setImage:[UIImage imageNamed:@"btn_uncollection"] forState:UIControlStateNormal];
    self.collectionBtn.tag = 1;
    
    self.supportBtn = [[BACustomButton alloc] initWitAligenmentStatus:BAAligenmentStatusTop];
    self.supportBtn.frame = CGRectMake(CGRectGetMaxX(self.collectionBtn.frame), 0, BA_SCREEN_WIDTH/4, 80);
    [self.supportBtn setTitle:@"点赞" forState:UIControlStateNormal];
    [self.supportBtn setTitleColor:BA_TEXTGrayColor forState:UIControlStateNormal];
    [self.supportBtn setImage:[UIImage imageNamed:@"btn_unsupport"] forState:UIControlStateNormal];
    self.supportBtn.tag = 2;

    
    self.shareBtn = [[BACustomButton alloc] initWitAligenmentStatus:BAAligenmentStatusTop];
    self.shareBtn.frame = CGRectMake(CGRectGetMaxX(self.supportBtn.frame), 0, BA_SCREEN_WIDTH/4, 80);
    [self.shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [self.shareBtn setTitleColor:BA_TEXTGrayColor forState:UIControlStateNormal];
    [self.shareBtn setImage:[UIImage imageNamed:@"btn_share"] forState:UIControlStateNormal];
    self.shareBtn.tag = 3;

    
    self.shangBtn = [[BACustomButton alloc] initWitAligenmentStatus:BAAligenmentStatusTop];
    self.shangBtn.frame = CGRectMake(CGRectGetMaxX(self.shareBtn.frame), 0, BA_SCREEN_WIDTH/4, 80);
    [self.shangBtn setTitle:@"赏" forState:UIControlStateNormal];
    [self.shangBtn setTitleColor:BA_TEXTGrayColor forState:UIControlStateNormal];
    [self.shangBtn setImage:[UIImage imageNamed:@"btn_shang"] forState:UIControlStateNormal];
    self.shangBtn.tag = 4;

    [self.collectionBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.supportBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.shareBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.shangBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:self.collectionBtn];
    [self.contentView addSubview:self.supportBtn];
    [self.contentView addSubview:self.shareBtn];
    [self.contentView addSubview:self.shangBtn];
    
//    self.collectionBtn.sd_layout
//    .leftSpaceToView(self.contentView, 0)
//    .topSpaceToView(self.contentView, 0)
//    .widthRatioToView(self.contentView, 0.25)
//    .heightIs(80);
//    
//    self.supportBtn.sd_layout
//    .leftSpaceToView(self.collectionBtn, 0)
//    .topEqualToView(self.collectionBtn)
//    .widthRatioToView(self.contentView, 0.25)
//    .heightIs(80);
//    
//    self.shareBtn.sd_layout
//    .leftSpaceToView(self.supportBtn, 0)
//    .topEqualToView(self.collectionBtn)
//    .widthRatioToView(self.contentView, 0.25)
//    .heightIs(80);
//    
//    self.shangBtn.sd_layout
//    .leftSpaceToView(self.shareBtn, 0)
//    .topEqualToView(self.collectionBtn)
//    .widthRatioToView(self.contentView, 0.25)
//    .heightIs(80);
}

- (IBAction)clickButton:(UIButton *)sender
{
    if (self.clickIndexBlock)
    {
        self.clickIndexBlock(sender.tag);
        BALog(@"点击了 %ld个按钮！", (long)sender.tag);
    }
}

- (void)callBackIndex:(cilckIndexBlock)clickIndex
{
    self.clickIndexBlock = clickIndex;
}

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
