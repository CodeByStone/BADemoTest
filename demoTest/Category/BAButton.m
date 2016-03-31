//
//  BAButton.m
//  demoTest
//
//  Created by 博爱 on 16/3/31.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAButton.h"

@implementation BAButton
{
    UIImageView *_overlayImgView;
    CGFloat _fadeDuration;
}

- (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 image:(UIImage * _Nonnull)image
                      highlightedImage:(UIImage * _Nonnull)highlightedImage
                          fadeDuration:(CGFloat)fadeDuration {
    if ((self = [BAButton buttonWithType:UIButtonTypeCustom])) {
        self.frame = frame;
        
        _fadeDuration = fadeDuration;
        
        [self setImage:image forState:UIControlStateNormal];
        self.overlayImgView = [[UIImageView alloc] initWithImage:highlightedImage];
        _overlayImgView.frame = self.imageView.frame;
        _overlayImgView.bounds = self.imageView.bounds;
        
        self.adjustsImageWhenHighlighted = NO;
    }
    
    return self;
}


- (void)setHighlighted:(BOOL)highlighted {
    if (![self isHighlighted] && highlighted) {
        [self addSubview:_overlayImgView];
        
        [UIView animateWithDuration:_fadeDuration animations:^{
            _overlayImgView.alpha = 1;
        } completion:NULL];
    } else if ([self isHighlighted] && !highlighted) {
        [UIView animateWithDuration:_fadeDuration animations:^{
            _overlayImgView.alpha = 0;
        } completion:^(BOOL finished) {
            [_overlayImgView removeFromSuperview];
        }];
    }
    
    [super setHighlighted:highlighted];
}

- (void)setOverlayImgView:(UIImageView *)overlayImgView {
    if (overlayImgView != _overlayImgView) {
        _overlayImgView = overlayImgView;
    }
    
    _overlayImgView.alpha = 0;
}


@end
