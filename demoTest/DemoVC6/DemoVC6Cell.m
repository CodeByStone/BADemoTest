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
    self.weixinImageView.layer.cornerRadius = 40/2;
    
    self.weixinNameLable = [UILabel new];
    self.weixinNameLable.font = KFontSize(15);
    
    self.weixinTimeLable = [UILabel new];
    self.weixinTimeLable.font = KFontSize(12);
    self.weixinTimeLable.textColor = kTEXTGrayColor;
    
    self.weixinContentLable = [UILabel new];
    self.weixinContentLable.font = KFontSize(14);
    
    NSArray *viewsArray = @[self.weixinImageView, self.weixinNameLable, self.weixinTimeLable, self.weixinContentLable];
    [self.contentView BA_AddSubViewsWithArray:viewsArray];

    
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    
    self.weixinImageView.sd_layout
    .leftSpaceToView(contentView, margin)
    .topSpaceToView(contentView, margin)
    .widthIs(40)
    .heightIs(40);
    
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
