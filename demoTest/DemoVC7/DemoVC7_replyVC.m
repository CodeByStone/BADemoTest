//
//  DemoVC7_replyVC.m
//  demoTest
//
//  Created by 博爱 on 16/3/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC7_replyVC.h"
#import "DemoVC7Model.h"
#import "DemoVC7_quesstionCell.h"
#import "DemoVC7_replyView.h"

@interface DemoVC7_replyVC ()

@end

@implementation DemoVC7_replyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = kBGGrayColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self creatReplyData];
    [self creatSendReplyView];
    
    NSLog(@"%s self.replyDataArray: %@", __func__,self.quesstionDataModel);
}

#pragma mark - ***** 添加评论View
- (void)creatSendReplyView
{
    CGRect frame = CGRectMake(0, KSCREEN_HEIGHT - 50 - 64, KSCREEN_WIDTH, 50);
    DemoVC7_replyView *replyView = [[DemoVC7_replyView alloc] initWithFrame:frame withImage:self.quesstionDataModel.icon7];
    replyView.backgroundColor = KCOLOR(245, 244, 245, 1.0);
    [self.view addSubview:replyView];

    [replyView callBackIndex:^(NSInteger index, NSString *contentStr) {
        
        NSString *msg = [NSString stringWithFormat:@"发送内容：%@", contentStr];
        SHOW_ALERT(@"温馨提示：", msg);
        
        DemoVC7Model *model = [DemoVC7Model new];
        model.icon7 = self.quesstionDataModel.icon7;
        model.userName7 = self.quesstionDataModel.userName7;
        model.content7 = contentStr;
        model.time7 = [self getCurrentDateAndTime];
        
        [self.replyDataArray addObject:model];
        [self.tableView reloadData];
    }];
//    replyView.sd_layout
//    .leftSpaceToView(self.view, 0)
//    .rightSpaceToView(self.view, 0)
//    .bottomSpaceToView(self.view, 0)
//    .heightIs(50);
}

#pragma mark - ***** 添加ReplyData
- (void)creatReplyData
{
    if (!_replyDataArray) {
        _replyDataArray = [NSMutableArray new];
    }
    
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     ];
    
    NSArray *namesArray = @[@"博爱",
                            @"风口上的猪",
                            @"当今世界网名都不好起了",
                            @"我叫郭德纲",
                            @"Hello Kitty"];
    
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"当你的 app 没有提供 3x 的 LaunchImage 时",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。"
                           ];
    
    NSArray *timeArray = @[@"2016-03-06",@"2016-03-07",@"2016-03-08",@"2016-03-09",@"2016-03-10"];
    
    for (int i = 0; i < BARandomData; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        int picRandomIndex = arc4random_uniform(5);
        
        DemoVC7Model *model = [DemoVC7Model new];
        model.icon7 = iconImageNamesArray[iconRandomIndex];
        model.userName7 = namesArray[nameRandomIndex];
        model.content7 = textArray[contentRandomIndex];
        model.time7 = timeArray[picRandomIndex];
        
        [self.replyDataArray addObject:model];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    return self.replyDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellID = @"DemoVC7_quesstionCell";
    DemoVC7_quesstionCell *quesstionCell7 = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!quesstionCell7)
    {
        quesstionCell7 = [[DemoVC7_quesstionCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    if (indexPath.section == 0)
    {
        quesstionCell7.backgroundColor = kWHITECOLOR;
        quesstionCell7.model = self.quesstionDataModel;
    }
    else
    {
        quesstionCell7.backgroundColor = kBGGrayColor;
        quesstionCell7.model = self.replyDataArray[indexPath.row];
    }
    
    return quesstionCell7;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return [self.tableView cellHeightForIndexPath:indexPath model:self.quesstionDataModel keyPath:@"model" cellClass:[DemoVC7_quesstionCell class] contentViewWidth:[self cellContentViewWith]];
    }
    else
    {
        return [self.tableView cellHeightForIndexPath:indexPath model:self.replyDataArray[indexPath.row] keyPath:@"model" cellClass:[DemoVC7_quesstionCell class] contentViewWidth:[self cellContentViewWith]];
    }
    return 0;
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

#pragma mark - 获得系统当前日期和时间
- (NSString *)getCurrentDateAndTime
{
    //获得系统日期
    NSDate *senddate = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *morelocationString = [dateformatter stringFromDate:senddate];
    NSLog(@"当前日期为：%@", morelocationString);
    
    return morelocationString;
}


@end
