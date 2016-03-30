//
//  DemoVC7_replyView.m
//  demoTest
//
//  Created by 博爱 on 16/3/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC7_replyView.h"

@interface DemoVC7_replyView ()

@property (nonatomic, copy) cilckIndexBlock clickIndexBlock;

@end

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
    userImageView.image = [UIImage imageNamed:imageNameStr];
    userImageView.layer.masksToBounds = YES;
    userImageView.layer.cornerRadius = 40/2;

    replyTextField = [UITextField new];
    replyTextField.borderStyle = UITextBorderStyleRoundedRect;
    replyTextField.placeholder = @"评论问题";
    
    sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sendButton.layer.cornerRadius =  5.0f;
    sendButton.layer.borderWidth = 1.0;
    sendButton.layer.borderColor = BA_TEXTGrayColor.CGColor;
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sendButton.titleLabel.font = BA_FontSize(15);
    [sendButton addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
    sendButton.tag = 1;
    
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
    
    replyTextField.sd_layout
    .leftSpaceToView(userImageView, margin)
    .topSpaceToView(self, margin)
    .rightSpaceToView(sendButton, margin)
    .heightIs(40);
    
    sendButton.sd_layout
    .rightSpaceToView(self, margin)
    .topEqualToView(replyTextField)
    .widthIs(50)
    .heightIs(40);
}

- (IBAction)sendMessage:(UIButton *)sender
{
    if (self.clickIndexBlock)
    {
        self.clickIndexBlock(sender.tag, replyTextField.text);
    }
}

- (void)callBackIndex:(cilckIndexBlock)clickIndex
{
    self.clickIndexBlock = clickIndex;
}

@end
