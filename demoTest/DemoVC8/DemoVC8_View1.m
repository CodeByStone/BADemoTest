//
//  DemoVC8_View1.m
//  demoTest
//
//  Created by 博爱 on 16/3/19.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC8_View1.h"

@implementation DemoVC8_View1
{
    UIScrollView *bgScrollView;
    UIView *subView1;
    UILabel *subView1_Label1;
    UILabel *subView1_Label2;

    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    bgScrollView = [UIScrollView new];
    [self addSubview:bgScrollView];
    
    // 设置scrollview与父view的边距
    bgScrollView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    [self setupScrollViewSubView1];
    [self setupScrollViewSubView2];
    
    // 设置scrollview的contentsize自适应
    [bgScrollView setupAutoContentSizeWithBottomView:subView1_Label2 bottomMargin:10];
}

// 设置scrollview的第一个子深粉色view（包含左边一个label、右边一个button的深粉色view，这个view根据label文字高度自适应）
- (void)setupScrollViewSubView1
{
    subView1 = [UIView new];
    subView1.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.3];
    [bgScrollView addSubview:subView1];
    
    subView1_Label1 = [UILabel new];
    subView1_Label1.text = @"这是测试nameLabel!";
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.backgroundColor = NaviBgBlueColor;
    rightBtn.layer.masksToBounds = YES;
    rightBtn.layer.cornerRadius = 5.0f;
    [rightBtn setTitle:@"添加文字" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(subView1RightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *viewsArray = @[subView1_Label1, rightBtn];
    [subView1 BA_AddSubViewsWithArray:viewsArray];
    
    CGFloat margin = 10;
    
    subView1_Label1.sd_layout
    .leftSpaceToView(subView1, margin)
    .rightSpaceToView(subView1, 100)
    .topSpaceToView(subView1, margin)
    .autoHeightRatio(0);  // 此行设置label文字自适应
    
    rightBtn.sd_layout
    .bottomEqualToView(subView1)
    .rightSpaceToView(subView1, margin)
    .widthIs(80)
    .heightIs(20);
    
    subView1.sd_layout
    .leftSpaceToView(bgScrollView, margin)
    .rightSpaceToView(bgScrollView, margin)
    .topSpaceToView(bgScrollView, margin);
    
    // 设置subView1根据label的具体内容而自适应
    [subView1 setupAutoHeightWithBottomView:subView1_Label1 bottomMargin:margin];
}

- (void)setupScrollViewSubView2
{
    subView1_Label2 = [UILabel new];
    subView1_Label2.text = [NSString stringWithFormat:@"共有%ld个字符!", [subView1_Label1.text length]];
    subView1_Label2.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.3];
    [bgScrollView addSubview:subView1_Label2];
    
    subView1_Label2.sd_layout
    .topSpaceToView(subView1, 10)
    .centerXEqualToView(subView1)
    .heightIs(30);
    [subView1_Label2 setSingleLineAutoResizeWithMaxWidth:300];
}

- (IBAction)subView1RightBtnClicked:(UIButton *)sender
{
    NSString *addStr = [NSString stringWithFormat:@"新增内容，时间：%@", [NSString BA_time_getCurrentDateAndTime]];
    
    subView1_Label1.text = [NSString stringWithFormat:@"%@\r%@", subView1_Label1.text, addStr];
    
    [subView1_Label1 updateLayout];
    
    subView1_Label2.text = [NSString stringWithFormat:@"共有%ld个字符!", [subView1_Label1.text length]];
    
    if (bgScrollView.contentSize.height > bgScrollView.height)
    {
        CGPoint point = bgScrollView.contentOffset;
        point.y = bgScrollView.contentSize.height - bgScrollView.height;
        
        [UIView animateWithDuration:0.8 animations:^{
            bgScrollView.contentOffset = point;
        }];
    }
}




@end
