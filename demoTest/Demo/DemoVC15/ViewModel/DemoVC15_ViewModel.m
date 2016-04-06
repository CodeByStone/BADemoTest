//
//  DemoVC15_ViewModel.m
//  demoTest
//
//  Created by 博爱 on 16/4/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC15_ViewModel.h"
#import "DemoVC15Model.h"

#define BAStatusCellMargin 10


@implementation DemoVC15_ViewModel

- (void)setModel:(DemoVC15Model *)model
{
    _model = model;
    
    // 计算frame
    [self setUpCellFrame];

}

- (void)setUpCellFrame
{
    // 头像
    CGFloat imageX = BAStatusCellMargin;
    CGFloat imageY = imageX;
    CGFloat imageWH = 40;
    _imageNameFrame = CGRectMake(imageX, imageY, imageWH, imageWH);

    // 用户名Frame
    CGFloat nameX = CGRectGetMaxX(_imageNameFrame) + BAStatusCellMargin;
    CGFloat nameY = imageY;
    CGSize nameSize = [_model.userName sizeWithAttributes:@{NSFontAttributeName:BA_FontSize(14)}];
    _userNameFrame = (CGRect){{nameX,nameY},nameSize};

    // 星星Frame
    CGFloat starNumberX = CGRectGetMaxX(_userNameFrame) + BAStatusCellMargin*0.5;
    CGFloat starNumberY = nameY;
    _starNumberFrame = (CGRect){{starNumberX,starNumberY},{80, 20}};
    
    // 加好友Frame
    CGFloat addFriendButtonX = BA_SCREEN_WIDTH - 75;
    CGFloat addFriendButtonY = nameY;
    _addFriendButtonFrame = (CGRect){{addFriendButtonX,addFriendButtonY},{65, 20}};
    
    // 时间Frame
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(_userNameFrame) + BAStatusCellMargin * 0.5;
    CGSize timeSize = [_model.time sizeWithAttributes:@{NSFontAttributeName:BA_FontSize(12)}];
    _timeFrame = (CGRect){{timeX,timeY},timeSize};

    // 文字内容Frame
    CGFloat textX = imageX;
    CGFloat textY = CGRectGetMaxY(_timeFrame) + BAStatusCellMargin;
    CGFloat textW = BA_SCREEN_WIDTH - 2 * BAStatusCellMargin;
    CGRect textSize = [_model.content boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:BA_FontSize(14)} context:nil];

    _contentFrame = (CGRect){{textX,textY},textSize.size};
    
    // 回复Frame
    CGFloat replyButtonX = BA_SCREEN_WIDTH - 60;
    CGFloat replyButtonY = CGRectGetMaxY(_contentFrame) + BAStatusCellMargin;
    _replyButtonFrame = (CGRect){{replyButtonX, replyButtonY},{50, 15}};
    
    // vlineImageViewFrame
    CGFloat vlineImageViewX = CGRectGetMinX(_replyButtonFrame) - 5 - 1;
    CGFloat vlineImageViewY = replyButtonY;
    _vlineImageViewFrame = (CGRect){{vlineImageViewX, vlineImageViewY},{1, 15}};
    
    // 点赞数Frame
    CGFloat supportNumberX =  CGRectGetMinX(_vlineImageViewFrame) - 80 - 5;
    CGFloat supportNumberY = replyButtonY;
    _supportNumberFrame = (CGRect){{supportNumberX,supportNumberY},{80, 20}};
    
    // 计算cell高度
    self.cellHeight = CGRectGetMaxY(_supportNumberFrame) + BAStatusCellMargin*0.5;
}

@end
