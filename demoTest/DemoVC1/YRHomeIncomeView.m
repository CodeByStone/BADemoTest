//
//  YRHomeIncomeView.m
//  yrapp
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import "YRHomeIncomeView.h"
#import "BAHeader.h"
#import "YRHomeIncomeBlockView.h"

@implementation YRHomeIncomeView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView
{
    UIImageView *bgView = [UIImageView new];
    bgView.frame = self.bounds;
    bgView.backgroundColor = [UIColor clearColor];
    bgView.image = [UIImage imageNamed:@"home_bgImg"];
    bgView.userInteractionEnabled = YES;

    
    UILabel *myIncomLabel = [UILabel new];
    myIncomLabel.frame = CGRectMake(0, 0, self.width/2, 35);
    myIncomLabel.backgroundColor = [UIColor clearColor];
    myIncomLabel.text = @"我的收入";
    myIncomLabel.textColor = kWHITECOLOR;
    myIncomLabel.textAlignment = NSTextAlignmentCenter;
    
    UILabel *incomRankLabel = [UILabel new];
    incomRankLabel.frame = CGRectMake(self.width/2, 0, self.width/2, 35);
    incomRankLabel.backgroundColor = [UIColor clearColor];
    incomRankLabel.text = @"收入排行榜";
    incomRankLabel.textColor = kWHITECOLOR;
    incomRankLabel.textAlignment = NSTextAlignmentCenter;
    
    UIView *IncomDataView = [UIView new];
    IncomDataView.frame = CGRectMake(0, CGRectGetMaxY(myIncomLabel.frame), self.width/2, self.height - myIncomLabel.height);
    IncomDataView.backgroundColor = [UIColor clearColor];
    
    YRHomeIncomeBlockView *IncomRankDataView = [[YRHomeIncomeBlockView alloc] initWithFrame:CGRectMake(self.width/2, CGRectGetMaxY(myIncomLabel.frame), self.width/2, self.height - myIncomLabel.height) withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
        
        NSString *msg = [NSString stringWithFormat:@"你点击了第 %ld 行！", (long)indexPath.row];
        NSLog(@"%@",msg);
    }];
    
    UILabel *incomTotalLabel = [UILabel new];
    incomTotalLabel.frame = CGRectMake(0, 0, IncomRankDataView.width, IncomRankDataView.height/2);
    incomTotalLabel.backgroundColor = [UIColor clearColor];
    incomTotalLabel.text = @"10000";
    incomTotalLabel.textColor = NaviBgBlueColor;
    incomTotalLabel.textAlignment = NSTextAlignmentCenter;
    incomTotalLabel.font = KFontSize(20);
    
    UILabel *encourageLabel = [UILabel new];
    encourageLabel.frame = CGRectMake(0, CGRectGetMaxY(incomTotalLabel.frame), IncomRankDataView.width/2, IncomRankDataView.height/4);
    encourageLabel.backgroundColor = [UIColor clearColor];
    encourageLabel.text = @"奖励";
    encourageLabel.textColor = NaviBgBlueColor;
    encourageLabel.textAlignment = NSTextAlignmentCenter;
    encourageLabel.font = KFontSize(14);
    
    UILabel *encourageDataLabel = [UILabel new];
    encourageDataLabel.frame = CGRectMake(0, CGRectGetMaxY(encourageLabel.frame), IncomRankDataView.width/2, IncomRankDataView.height/4);
    encourageDataLabel.backgroundColor = [UIColor clearColor];
    encourageDataLabel.text = @"1200";
    encourageDataLabel.textColor = NaviBgBlueColor;
    encourageDataLabel.textAlignment = NSTextAlignmentCenter;
    encourageDataLabel.font = KFontSize(14);
    
    UILabel *punishLabel = [UILabel new];
    punishLabel.frame = CGRectMake(IncomRankDataView.width/2, CGRectGetMaxY(incomTotalLabel.frame), IncomRankDataView.width/2, IncomRankDataView.height/4);
    punishLabel.backgroundColor = [UIColor clearColor];
    punishLabel.text = @"处罚";
    punishLabel.textColor = [UIColor redColor];
    punishLabel.textAlignment = NSTextAlignmentCenter;
    punishLabel.font = KFontSize(14);
    
    UILabel *punishDataLabel = [UILabel new];
    punishDataLabel.frame = CGRectMake(IncomRankDataView.width/2, CGRectGetMaxY(punishLabel.frame), IncomRankDataView.width/2, IncomRankDataView.height/4);
    punishDataLabel.backgroundColor = [UIColor clearColor];
    punishDataLabel.text = @"200";
    punishDataLabel.textColor = [UIColor redColor];
    punishDataLabel.textAlignment = NSTextAlignmentCenter;
    punishDataLabel.font = KFontSize(14);
    
   
    
    [bgView addSubview:myIncomLabel];
    [bgView addSubview:incomRankLabel];
    [bgView addSubview:IncomDataView];
    [bgView addSubview:IncomRankDataView];
    [IncomDataView addSubview:incomTotalLabel];
    [IncomDataView addSubview:encourageLabel];
    [IncomDataView addSubview:encourageDataLabel];
    [IncomDataView addSubview:punishLabel];
    [IncomDataView addSubview:punishDataLabel];

    [self addSubview:bgView];
    
    
    
    
    
}


@end
