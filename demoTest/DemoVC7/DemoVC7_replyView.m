//
//  DemoVC7_replyView.m
//  demoTest
//
//  Created by 博爱 on 16/3/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC7_replyView.h"

@implementation DemoVC7_replyView
{
    NSString *imageNameStr;
    UIImageView *userImageView;
    UITextField *replyTextField;
    UIButton *sendButton;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)imageName
{
    self = [super initWithFrame:frame];
    if (self)
    {
        imageNameStr = imageName;
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView
{
    userImageView = [UIImageView new];
    userImageView.layer.masksToBounds = YES;
    userImageView.layer.cornerRadius = 50/2;

    replyTextField = [UITextField new];
    replyTextField.borderStyle = UITextBorderStyleRoundedRect;
    replyTextField.placeholder = @"评论问题";
    
    sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sendButton.layer.cornerRadius =  5.0f;
    sendButton.backgroundColor = kBGGrayColor;
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    
    NSArray *views = @[userImageView, replyTextField, sendButton];
    [views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addSubview:obj];
    }];
    
    CGFloat margin = 5;
    
    userImageView.sd_layout
    .leftSpaceToView(self, margin)
    .topSpaceToView(self, margin)
    .widthIs(40)
    .heightIs(40);
    
//    replyTextField.sd_layout
//    .leftSpaceToView(userImageView, margin)
//    .topSpaceToView(self, margin)
//    .
    
    
    
}

@end
