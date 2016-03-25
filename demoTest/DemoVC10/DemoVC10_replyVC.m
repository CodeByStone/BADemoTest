//
//  DemoVC10_replyVC.m
//  demoTest
//
//  Created by 博爱 on 16/3/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC10_replyVC.h"
#import "DemoVC7_replyView.h"
#import "DemoVC10Cell.h"

@interface DemoVC10_replyVC ()

@end

@implementation DemoVC10_replyVC

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
    DemoVC7_replyView *replyView = [[DemoVC7_replyView alloc] initWithFrame:frame withImage:self.quesstionDataModel.imageName];
    replyView.backgroundColor = KCOLOR(245, 244, 245, 1.0);
    [self.view addSubview:replyView];
    
    [replyView callBackIndex:^(NSInteger index, NSString *contentStr) {
        
        NSString *msg = [NSString stringWithFormat:@"发送内容：%@", contentStr];
        SHOW_ALERT(@"温馨提示：", msg);
        
        DemoVC10Model *model = [DemoVC10Model new];
        model.imageName = self.quesstionDataModel.imageName;
        model.userName = self.quesstionDataModel.userName;
        model.content = contentStr;
        model.time = [NSString BA_time_getCurrentDateAndTime];
        
        [self.replyDataArray addObject:model];
        [self.tableView reloadData];
    }];
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
        
        DemoVC10Model *model = [DemoVC10Model new];
        model.imageName = iconImageNamesArray[iconRandomIndex];
        model.userName = namesArray[nameRandomIndex];
        model.content = textArray[contentRandomIndex];
        model.time = timeArray[picRandomIndex];
        
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
        return 2;
    }
    return self.replyDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            static NSString *cellID = @"Cell";
            DemoVC10Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell)
            {
                cell = [[DemoVC10Cell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            }
            cell.backgroundColor = kWHITECOLOR;
            cell.addFriendButton.hidden = YES;
            cell.model = self.quesstionDataModel;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
        }
        if (indexPath.row == 1)
        {
            static NSString *cellID2 = @"DemoVC10_replyCell";
            DemoVC10_replyCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellID2];
            if (!cell2)
            {
                cell2 = [[DemoVC10_replyCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            }
            cell2.backgroundColor = kWHITECOLOR;
            cell2.model = self.replyDataModel;
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell2;
        }
    }
    else
    {
        static NSString *cellID2 = @"DemoVC10_replyCell";
        DemoVC10_replyVC_replyCell *cell3 = [tableView dequeueReusableCellWithIdentifier:cellID2];
        if (!cell3)
        {
            cell3 = [[DemoVC10_replyVC_replyCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        }
        cell3.backgroundColor = kBGGrayColor;
        cell3.model = self.replyDataArray[indexPath.row];
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell3;
    }
    
    return nil;
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
        if (indexPath.row == 0)
        {
            return [self.tableView cellHeightForIndexPath:indexPath model:self.quesstionDataModel keyPath:@"model" cellClass:[DemoVC10Cell class] contentViewWidth:[self cellContentViewWith]];
        }
        else
        {
            id model = self.replyDataModel;
            return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[DemoVC10_replyCell class] contentViewWidth:[self cellContentViewWith]];
        }
    }
    else
    {
        return [self.tableView cellHeightForIndexPath:indexPath model:self.replyDataArray[indexPath.row] keyPath:@"model" cellClass:[DemoVC10_replyVC_replyCell class] contentViewWidth:[self cellContentViewWith]];
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


@end
