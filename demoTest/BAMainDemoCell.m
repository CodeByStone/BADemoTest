//
//  BAMainDemoCell.m
//  demoTest
//
//  Created by 博爱 on 16/4/27.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAMainDemoCell.h"

@implementation BAMainDemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
//    UILabel *titleLabel = [UILabel new];
//    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.font = [UIFont systemFontOfSize:15];
//    [self.contentView addSubview:titleLabel];
//    self.titleLabel = titleLabel;
    
    UILabel *contentLabel = [UILabel new];
    contentLabel.textColor = [UIColor whiteColor];
    contentLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    CGFloat margin = 10;
    
//    self.titleLabel.sd_layout
//    .leftSpaceToView(self.contentView, margin)
//    .topSpaceToView(self.contentView, margin)
//    .rightSpaceToView(self.contentView, margin)
//    .heightIs(20);
    
    self.contentLabel.sd_layout
    .leftSpaceToView(self.contentView, margin)
    .rightEqualToView(self.contentView)
    .topSpaceToView(self.contentView, margin)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:self.contentLabel bottomMargin:margin];
}

@end
