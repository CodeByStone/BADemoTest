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
<
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DemoVC10_replyVC

- (UITableView *)tableView
{
    if (!_tableView)
    {
        [self creatReplyData];
        [self creatSendReplyView];
        
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = BA_BGGrayColor;
        
        [self.view addSubview:_tableView];
        
        self.tableView.sd_layout
        .leftSpaceToView(self.view, 0)
        .rightSpaceToView(self.view, 0)
        .topSpaceToView(self.view, 64)
        .bottomSpaceToView(self.view, 50);
        
        _tableView.tableFooterView = [UIView new];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_White_Color;
    self.tableView.hidden = NO;
    NSLog(@"%s self.replyDataArray: %@", __func__,self.quesstionDataModel);
}

#pragma mark - ***** 添加评论View
- (void)creatSendReplyView
{
    CGRect frame = CGRectMake(0, BA_SCREEN_HEIGHT - 50, BA_SCREEN_WIDTH, 50);
    DemoVC7_replyView *replyView = [[DemoVC7_replyView alloc] initWithFrame:frame withImage:self.quesstionDataModel.imageName callBackIndex:^(NSString *contentStr) {
        
        NSString *msg = [NSString stringWithFormat:@"发送内容：%@", contentStr];
        BA_SHOW_ALERT(@"温馨提示：", msg);
        
        DemoVC10Model *model = [DemoVC10Model new];
        model.imageName = self.quesstionDataModel.imageName;
        model.userName = self.quesstionDataModel.userName;
        model.content = contentStr;
        model.time = [NSString BA_time_getCurrentDateAndTime];
        
        [self.replyDataArray addObject:model];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    replyView.backgroundColor = BA_COLOR(245, 244, 245, 1.0);
    [self.view addSubview:replyView];
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
    
    for (int i = 0; i < BA_RandomData; i++) {
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
                cell = [[DemoVC10Cell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
            }
            cell.backgroundColor = BA_White_Color;
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
            cell2.backgroundColor = BA_White_Color;
            cell2.model = self.replyDataModel;
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell2;
        }
    }
    else
    {
        static NSString *cellID2 = @"DemoVC10_replyVC_replyCell";
        DemoVC10_replyVC_replyCell *cell3 = [tableView dequeueReusableCellWithIdentifier:cellID2];
        if (!cell3)
        {
            cell3 = [[DemoVC10_replyVC_replyCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID2];
        }
        cell3.backgroundColor = BA_BGGrayColor;
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
