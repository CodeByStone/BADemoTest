//
//  DemoVC3Cell.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC3Cell.h"
#import "DemoVC3Model.h"

const CGFloat contentLabelFontSizes = 15;
const CGFloat maxContentLabelHeights = 54;

@implementation DemoVC3Cell
{
    UILabel *_titleLable;
    UILabel *_contentLabel;
    UIButton *_playButton;
    UIButton *_moreButton;
//    UILabel *_timeLabel;
    BOOL _shouldOpenContentLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _shouldOpenContentLabel = NO;
    
    _titleLable = [UILabel new];
    _titleLable.font = KFontSize(15);
    
    _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _playButton.userInteractionEnabled = NO;
    [_playButton setImage:[UIImage imageNamed:@"playCount"] forState:UIControlStateNormal];
    [_playButton setTitleColor:kTEXTGrayColor forState:UIControlStateNormal];

    
    _contentLabel = [UILabel new];
    _contentLabel.font = [UIFont systemFontOfSize:contentLabelFontSizes];
    
    _moreButton = [UIButton new];
    [_moreButton setTitle:@"显示全部" forState:UIControlStateNormal];
    [_moreButton setTitleColor:NaviBgBlueColor forState:UIControlStateNormal];
    [_moreButton addTarget:self action:@selector(moreButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    _moreButton.titleLabel.font = KFontSize(14);
    
//    _timeLabel = [UILabel new];
//    _timeLabel.font = [UIFont systemFontOfSize:13];
//    _timeLabel.textColor = [UIColor lightGrayColor];
    
    NSArray *viewsArray = @[_titleLable, _playButton, _contentLabel, _moreButton];
    [viewsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.contentView addSubview:obj];
    }];
    
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    
    _titleLable.sd_layout
    .leftSpaceToView(contentView, margin)
    .topSpaceToView(contentView, margin)
    .heightIs(20);
    [_titleLable setSingleLineAutoResizeWithMaxWidth:200];
    
    _playButton.sd_layout
    .leftEqualToView(_titleLable)
    .topSpaceToView(_titleLable, margin)
    .widthIs(100)
    .heightIs(20);
    
    _contentLabel.sd_layout
    .leftEqualToView(_titleLable)
    .topSpaceToView(_playButton, margin)
    .rightSpaceToView(contentView, margin)
    .autoHeightRatio(0);
    
    // morebutton的高度在setmodel里面设置
    _moreButton.sd_layout
    .leftEqualToView(_contentLabel)
    .topSpaceToView(_contentLabel, 0)
    .widthIs(60);
    
//    _timeLabel.sd_layout
//    .leftEqualToView(_contentLabel)
//    .topSpaceToView(_contentLabel, margin)
//    .heightIs(15)
//    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:_moreButton bottomMargin:margin + 5];
}

- (void)setModel:(DemoVC3Model *)model
{
    _model = model;
    
    NSLog(@"00000 %@", model.content);
    
    _shouldOpenContentLabel = NO;
    
    _titleLable.text = model.title;
    // 防止单行文本label在重用时宽度计算不准的问题
    [_titleLable sizeToFit];
    [_playButton setTitle:model.playNumber forState:UIControlStateNormal];
//    _playButton.titleLabel.adjustsFontSizeToFitWidth = YES;
//    _playButton.titleLabel.minimumFontSize = 5;
//    [_playButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 18, 0)];
    
    _contentLabel.text = model.content;
    
    if (model.shouldShowMoreButton) { // 如果文字高度超过60
        _moreButton.sd_layout.heightIs(20);
        _moreButton.hidden = NO;
        if (model.isOpening) { // 如果需要展开
            _contentLabel.sd_layout.maxHeightIs(MAXFLOAT);
            [_moreButton setTitle:@"收起文字" forState:UIControlStateNormal];
        } else {
            _contentLabel.sd_layout.maxHeightIs(60);
            [_moreButton setTitle:@"显示全部" forState:UIControlStateNormal];
        }
    } else {
        _moreButton.sd_layout.heightIs(0);
        _moreButton.hidden = YES;
    }
//    _timeLabel.text = @"1分钟前";

}

- (void)moreButtonClicked
{
    if (self.moreButtonClickBlock) {
        self.moreButtonClickBlock(self.indexPath);
    }
}

@end
