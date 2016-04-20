//
//  DemoVC10.m
//  demoTest
//
//  Created by 博爱 on 16/3/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC10.h"
#import "DemoVC10Model.h"
#import "DemoVC10Cell.h"

#import "DemoVC10_replyVC.h"


@interface DemoVC10 ()

@property (nonatomic, strong) NSMutableArray *dataArray10;
@property (nonatomic, strong) NSMutableArray *replayDataArray;

@end

@implementation DemoVC10

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatModelsData10];
    [self creatReplyData];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)creatModelsData10
{
    if (!_dataArray10) {
        _dataArray10 = [NSMutableArray new];
    }
    
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     ];
    
    NSArray *namesArray = @[@"博爱",
                            @"小明",
                            @"张三",
                            @"我是小明的老师",
                            @"小三"];
    
    NSArray *textArray = @[@"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，让它从里到外焕然一新。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。",
                           @"iPhone SE 采用了备受欢迎的设计，并让它更加出色。铝金属表面经过喷砂工艺处理，打造出绸缎般的质感，让这款小巧、轻便的手机握持时手感非常舒适。绚丽的 4 英寸1 Retina 显示屏让图像显得生动、锐利。倒角边缘经过哑光处理，不锈钢 Apple 标志的颜色也与机身相配，整个外观显得格外精致。",
                           @"iPhone SE 的核心是 A9 芯片，它与 iPhone 6s 采用了相同的先进芯片。",
                           @"高能效的M9 运动协处理器M9 运动协处理器直接嵌入在 A9 芯片上，并与加速感应器、指南针及三轴陀螺仪相连，具备一系列追踪健身活动的功能，比如记录你的步数和距离。而且，有了它，你不必拿起 iPhone，只需说一声 “嘿 Siri” 就能轻松激活 Siri。",
                           @"Live Photos 可捕捉声音和动作，让你的影像生动鲜活。只需在你的 1200 万像素照片上按住任意位置，就能重温照片拍摄前后的时刻，让你的照片变成鲜活的记忆。"
                           ];
    
    NSArray *supportNumberArray = @[ @"111",
                                     @"222",
                                     @"3333",
                                     @"444",
                                     @"555",
                                     ];
    NSArray *timeArray = @[@"2016-03-06",@"2016-03-07",@"2016-03-08",@"2016-03-09",@"2016-03-10"];
    
    for (int i = 0; i < 10; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        int picRandomIndex = arc4random_uniform(5);
        
        DemoVC10Model *model = [DemoVC10Model new];
        model.imageName = iconImageNamesArray[iconRandomIndex];
        model.userName = namesArray[nameRandomIndex];
        model.content = textArray[contentRandomIndex];
        model.time = timeArray[picRandomIndex];
        model.commentNumber = supportNumberArray[picRandomIndex];
        
        [self.dataArray10 addObject:model];
    }
}

- (void)creatReplyData
{
    if (!_replayDataArray) {
        _replayDataArray = [NSMutableArray new];
    }
    
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     ];
    
    NSArray *namesArray = @[@"博爱",
                            @"小明",
                            @"张三",
                            @"我是小明的老师",
                            @"小三"];
    
    NSArray *textArray = @[@"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，让它从里到外焕然一新。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。",
                           @"iPhone SE 采用了备受欢迎的设计，并让它更加出色。铝金属表面经过喷砂工艺处理，打造出绸缎般的质感，让这款小巧、轻便的手机握持时手感非常舒适。绚丽的 4 英寸1 Retina 显示屏让图像显得生动、锐利。倒角边缘经过哑光处理，不锈钢 Apple 标志的颜色也与机身相配，整个外观显得格外精致。",
                           @"iPhone SE 的核心是 A9 芯片，它与 iPhone 6s 采用了相同的先进芯片。",
                           @"高能效的M9 运动协处理器M9 运动协处理器直接嵌入在 A9 芯片上，并与加速感应器、指南针及三轴陀螺仪相连，具备一系列追踪健身活动的功能，比如记录你的步数和距离。而且，有了它，你不必拿起 iPhone，只需说一声 “嘿 Siri” 就能轻松激活 Siri。",
                           @"Live Photos 可捕捉声音和动作，让你的影像生动鲜活。只需在你的 1200 万像素照片上按住任意位置，就能重温照片拍摄前后的时刻，让你的照片变成鲜活的记忆。"
                           ];
    
    NSArray *timeArray = @[@"2016-03-06",@"2016-03-07",@"2016-03-08",@"2016-03-09",@"2016-03-10"];
    
    for (int i = 0; i < 10; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        int picRandomIndex = arc4random_uniform(5);
        
        DemoVC10Model *model = [DemoVC10Model new];
        model.imageName = iconImageNamesArray[iconRandomIndex];
        model.userName = namesArray[nameRandomIndex];
        model.content = textArray[contentRandomIndex];
        model.time = timeArray[picRandomIndex];
        
        [self.replayDataArray addObject:model];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray10.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_replayDataArray)
    {
        return 2;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_replayDataArray)
    {
        if (indexPath.row == 0)
        {
            static NSString *cellID = @"Cell";
            DemoVC10Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell)
            {
                cell = [[DemoVC10Cell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            }

            cell.model = self.dataArray10[indexPath.section];
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
            
            cell2.model = self.replayDataArray[indexPath.section];
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell2;
        }
    }
    else
    {
        static NSString *cellID3 = @"Cell3";
        DemoVC10Cell *cell3 = [tableView dequeueReusableCellWithIdentifier:cellID3];
        if (!cell3)
        {
            cell3 = [[DemoVC10Cell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID3];
        }
        
        cell3.model = self.dataArray10[indexPath.section];
        cell3.vlineImageView.hidden = YES;
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell3;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_replayDataArray)
    {
        if (indexPath.row == 0)
        {
            return [self.tableView cellHeightForIndexPath:indexPath model:self.dataArray10[indexPath.section] keyPath:@"model" cellClass:[DemoVC10Cell class] contentViewWidth:[self cellContentViewWith]];
        }
        else
        {
            id model = self.replayDataArray[indexPath.section];
            return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[DemoVC10_replyCell class] contentViewWidth:[self cellContentViewWith]];
        }
    }
    else
    {
        return [self.tableView cellHeightForIndexPath:indexPath model:self.dataArray10[indexPath.section] keyPath:@"model" cellClass:[DemoVC10Cell class] contentViewWidth:[self cellContentViewWith]];
    }
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%s self.dataArray7: %@", __func__, self.dataArray7[indexPath.section]);
    
    DemoVC10_replyVC *replyVC = [[DemoVC10_replyVC alloc] init];
    replyVC.quesstionDataModel = self.dataArray10[indexPath.section];
    replyVC.replyDataModel = self.replayDataArray[indexPath.section];
    replyVC.title = [NSString stringWithFormat:@"回复%@的评论", replyVC.quesstionDataModel.userName];
    [self.navigationController pushViewController:replyVC animated:YES];
    
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
