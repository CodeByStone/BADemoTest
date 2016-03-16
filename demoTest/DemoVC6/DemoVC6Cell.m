//
//  DemoVC6Cell.m
//  demoTest
//
//  Created by 博爱 on 16/3/16.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC6Cell.h"

@interface DemoVC6Cell ()

@property (nonatomic, strong) UIImageView *weixinImageView;//图像
@property (nonatomic, strong) UILabel *weixinNameLable;//用户名
@property (nonatomic, strong) UILabel *weixinTimeLable;//发帖时间
@property (nonatomic, strong) UILabel *weixinContentLable;//发帖内容

@end

@implementation DemoVC6Cell

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
    self.weixinImageView.layer.cornerRadius = 60/2;
    
    self.weixinNameLable = [UILabel new];
    self.weixinNameLable.font = KFontSize(15);
    
    self.weixinTimeLable = [UILabel new];
    self.weixinTimeLable.font = KFontSize(12);
    self.weixinTimeLable.textColor = kTEXTGrayColor;
    
    self.weixinContentLable = [UILabel new];
    self.weixinContentLable.font = KFontSize(14);
    
//    [self.contentView addSubview:self.weixinImageView];
//    [self.contentView addSubview:self.weixinNameLable];
//    [self.contentView addSubview:self.weixinTimeLable];
//    [self.contentView addSubview:self.weixinContentLable];
    
//    [self.weixinImageView whc_LeftSpace:10];
//    [self.weixinImageView whc_TopSpace:10];
//    [self.weixinImageView whc_Height:60];
//    [self.weixinImageView whc_Width:60];
//    
//    [self.weixinNameLable whc_LeftSpace:10 relativeView:self.weixinImageView];
//    [self.weixinNameLable whc_TopSpace:10];
//    [self.weixinNameLable whc_RightSpace:10];
//    [self.weixinNameLable whc_Height:20];
//    
//    [self.weixinTimeLable whc_LeftSpace:10 relativeView:self.weixinImageView];
//    [self.weixinTimeLable whc_TopSpace:0 relativeView:self.weixinNameLable];
//    [self.weixinTimeLable whc_RightSpace:10];
//    [self.weixinTimeLable whc_Height:20];
//    
//    [self.weixinContentLable whc_LeftSpace:10 relativeView:self.weixinImageView];
//    [self.weixinContentLable whc_TopSpace:0 relativeView:self.weixinTimeLable];
//    [self.weixinContentLable whc_RightSpace:10];
//    [self.weixinContentLable whc_HeightAuto];
    
    NSArray *viewsArray = @[self.weixinImageView, self.weixinNameLable, self.weixinTimeLable, self.weixinContentLable];
    [viewsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.contentView addSubview:obj];
    }];
    
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    
    self.weixinImageView.sd_layout
    .leftSpaceToView(contentView, margin)
    .topSpaceToView(contentView, margin)
    .widthIs(60)
    .heightIs(60);
    
    self.weixinNameLable.sd_layout
    .leftSpaceToView(self.weixinImageView, margin)
    .topEqualToView(self.weixinImageView)
    .heightIs(20);
    [self.weixinNameLable setSingleLineAutoResizeWithMaxWidth:200];
    
    self.weixinTimeLable.sd_layout
    .leftEqualToView(self.weixinNameLable)
    .topSpaceToView(self.weixinNameLable, margin)
    .heightIs(20);
    [self.weixinTimeLable setSingleLineAutoResizeWithMaxWidth:200];
    
    self.weixinContentLable.sd_layout
    .leftEqualToView(self.weixinNameLable)
    .topSpaceToView(self.weixinTimeLable, margin)
    .rightSpaceToView(contentView, margin)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:self.weixinContentLable bottomMargin:margin];
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
