//
//  DemoVC3Model.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC3Model.h"


extern const CGFloat contentLabelFontSizes;
extern const CGFloat maxContentLabelHeights;

@implementation DemoVC3Model

@synthesize shouldShowMoreButton = _shouldShowMoreButton;
@synthesize content = _content;

- (void)setContent:(NSString *)content
{
    _content = content;
}

- (NSString *)content
{
    CGFloat contentW = BA_SCREEN_WIDTH - 20;
    CGRect textRect = [_content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentLabelFontSizes]} context:nil];
    
    if (textRect.size.height > maxContentLabelHeights)
    {
        _shouldShowMoreButton = YES;
    }
    else
    {
        _shouldShowMoreButton = NO;
    }
    return _content;
}

- (void)setIsOpening:(BOOL)isOpening
{
    if (!_shouldShowMoreButton)
    {
        _isOpening = NO;
    }
    else
    {
        _isOpening = isOpening;
    }
}


@end



