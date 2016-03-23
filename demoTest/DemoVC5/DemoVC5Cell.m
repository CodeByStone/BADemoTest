//
//  DemoVC5Cell.m
//  demoTest
//
//  Created by 博爱 on 16/3/16.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC5Cell.h"

@interface DemoVC5Cell ()

@property (nonatomic, strong) UIImageView *weixinImageView;//图像
@property (nonatomic, strong) UILabel *weixinNameLable;//用户名
@property (nonatomic, strong) UILabel *weixinTimeLable;//发帖时间
@property (nonatomic, strong) UILabel *weixinContentLable;//发帖内容

@end

@implementation DemoVC5Cell

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
    self.weixinImageView = [UIImageView new];
    self.weixinImageView.layer.masksToBounds = YES;
    self.weixinImageView.layer.cornerRadius = 40/2;
    
    self.weixinNameLable = [UILabel new];
    self.weixinNameLable.font = KFontSize(15);
    
    self.weixinTimeLable = [UILabel new];
    self.weixinTimeLable.font = KFontSize(12);
    self.weixinTimeLable.textColor = kTEXTGrayColor;
    
    self.weixinContentLable = [UILabel new];
    self.weixinContentLable.font = KFontSize(14);
    
    [self.contentView addSubview:self.weixinImageView];
    [self.contentView addSubview:self.weixinNameLable];
    [self.contentView addSubview:self.weixinTimeLable];
    [self.contentView addSubview:self.weixinContentLable];

    [self.weixinImageView whc_LeftSpace:10];
    [self.weixinImageView whc_TopSpace:10];
    [self.weixinImageView whc_Height:40];
    [self.weixinImageView whc_Width:40];
    
    [self.weixinNameLable whc_LeftSpace:10 relativeView:self.weixinImageView];
    [self.weixinNameLable whc_TopSpace:10];
    [self.weixinNameLable whc_RightSpace:10];
    [self.weixinNameLable whc_Height:20];
    
    [self.weixinTimeLable whc_LeftSpace:10 relativeView:self.weixinImageView];
    [self.weixinTimeLable whc_TopSpace:0 relativeView:self.weixinNameLable];
    [self.weixinTimeLable whc_RightSpace:10];
    [self.weixinTimeLable whc_Height:20];
    
    [self.weixinContentLable whc_LeftSpace:10 relativeView:self.weixinImageView];
    [self.weixinContentLable whc_TopSpace:0 relativeView:self.weixinTimeLable];
    [self.weixinContentLable whc_RightSpace:10];
    [self.weixinContentLable whc_HeightAuto];
    
}

- (void)setModel:(DemoVC5Model *)model
{
    _model = model;
    
    [self.weixinImageView setImage:[UIImage imageNamed:model.weixinIco]];
    self.weixinNameLable.text = model.weixinName;
    self.weixinTimeLable.text = model.weixinTime;
    self.weixinContentLable.text = model.weixinContent;
    
}

@end
