//
//  BAButton.h
//  demoTest
//
//  Created by 博爱 on 16/3/31.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

/*! 自定义按钮1：可以设置按钮的消失时间 */
@interface BAButton : UIButton

/**
 *  Create an UIButton with a fade animation from image to highlightedImage on touch
 *
 *  @param frame            Button's frame
 *  @param image            Button's image
 *  @param highlightedImage Button's highlighted image
 *  @param fadeDuration     Fade duration
 *
 *  @return Returns the created BFButton, subclass of UIButton
 */

- (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 image:(UIImage * _Nonnull)image
                      highlightedImage:(UIImage * _Nonnull)highlightedImage
                          fadeDuration:(CGFloat)fadeDuration;

@end

/*! 自定义按钮2：图片在上，文字在下 */
@interface BAButton_image_text : UIButton

@end

/*! 自定义按钮3：单选按钮（不带图片） */
@protocol BARadioButtonDelegate;
@interface BARadioButton : UIButton
{
    NSString                        *_groupId;
    BOOL                             _checked;
    id<BARadioButtonDelegate>         delegate;
}

@property (nonatomic, weak)          id<BARadioButtonDelegate>   delegate;
@property (nonatomic, copy, readonly)  NSString            *groupId;
@property (nonatomic, assign)          BOOL checked;

- (id)initWithDelegate:(id)delegate groupId:(NSString*)groupId;

@end

@protocol BARadioButtonDelegate <NSObject>

@optional

- (void)didSelectedRadioButton:(BARadioButton *)radio groupId:(NSString *)groupId;

@end

