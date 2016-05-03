//
//  DemoVC7_replyView.m
//  demoTest
//
//  Created by 博爱 on 16/3/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC7_replyView.h"

@implementation DemoVC7_replyView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)imageName callBackIndex:(cilckIndexBlock)clickIndex
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.clickIndexBlock = clickIndex;
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
    
    self.replyTextField = [UITextField new];
    self.replyTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.replyTextField.delegate = self;
    self.replyTextField.placeholder = @"评论问题";
    //    self.replyTextField.backgroundColor = [UIColor purpleColor];
    
    sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sendButton.layer.cornerRadius =  5.0f;
    sendButton.layer.borderWidth = 1.0;
    sendButton.layer.borderColor = BA_TEXTGrayColor.CGColor;
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sendButton.titleLabel.font = BA_FontSize(15);
    [sendButton addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
    //    sendButton.tag = 1;
    
    NSArray *views = @[userImageView, self.replyTextField, sendButton];
    [views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addSubview:obj];
    }];
    
    CGFloat margin = 5;
    
    userImageView.sd_layout
    .leftSpaceToView(self, margin)
    .topSpaceToView(self, margin)
    .widthIs(40)
    .heightIs(40);
    
    self.replyTextField.sd_layout
    .leftSpaceToView(self, 50)
    .topSpaceToView(self, margin)
    .rightSpaceToView(self, 60)
    .heightIs(40);
    
    sendButton.sd_layout
    .rightSpaceToView(self, margin)
    .topEqualToView(self.replyTextField)
    .widthIs(50)
    .heightIs(40);
}

- (IBAction)sendMessage:(UIButton *)sender
{
    if (self.clickIndexBlock)
    {
        self.clickIndexBlock(self.replyTextField.text);
        self.replyTextField.text = @"";
    }
}

@end
