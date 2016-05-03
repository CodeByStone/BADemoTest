//
//  DemoVC2Model.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2Model.h"


extern const CGFloat contentLabelFontSize;
extern const CGFloat maxContentLabelHeight;

@implementation DemoVC2Model

@synthesize shouldShowMoreButton = _shouldShowMoreButton;
@synthesize content = _content;

- (void)setContent:(NSString *)content
{
    _content = content;
}

- (NSString *)content
{
    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 70;
    CGRect textRect = [_content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentLabelFontSize]} context:nil];
    if (textRect.size.height > maxContentLabelHeight) {
        _shouldShowMoreButton = YES;
    } else {
        _shouldShowMoreButton = NO;
    }
    
    return _content;
}

- (void)setIsOpening:(BOOL)isOpening
{
    if (!_shouldShowMoreButton) {
        _isOpening = NO;
    } else {
        _isOpening = isOpening;
    }
}

@end
