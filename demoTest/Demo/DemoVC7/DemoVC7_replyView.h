//
//  DemoVC7_replyView.h
//  demoTest
//
//  Created by 博爱 on 16/3/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^cilckIndexBlock)(NSString *contentStr);

@interface DemoVC7_replyView : UIView<UITextFieldDelegate>
{
    NSString *imageNameStr;
    UIImageView *userImageView;
    UIButton *sendButton;
}
@property (nonatomic, strong) UITextField *replyTextField;
@property (nonatomic, copy) cilckIndexBlock clickIndexBlock;

- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)imageName callBackIndex:(cilckIndexBlock)clickIndex;


@end
