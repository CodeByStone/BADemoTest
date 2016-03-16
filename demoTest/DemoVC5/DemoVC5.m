//
//  DemoVC5.m
//  demoTest
//
//  Created by 博爱 on 16/3/16.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC5.h"
#import "DemoVC5Model.h"
#import "DemoVC5Cell.h"

@interface DemoVC5 ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation DemoVC5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatModelsData];
    
}

- (void)creatModelsData
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
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
    
//    NSArray *picImageNamesArray = @[ @"pic0.jpg",
//                                     @"pic1.jpg",
//                                     @"pic2.jpg",
//                                     @"pic3.jpg",
//                                     @"pic4.jpg",
//                                     ];
    NSArray *timeArray = @[@"2016-03-06",@"2016-03-07",@"2016-03-08",@"2016-03-09",@"2016-03-10"];
    
    for (int i = 0; i < 10; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        int picRandomIndex = arc4random_uniform(5);
        
        DemoVC5Model *model = [DemoVC5Model new];
        model.weixinIco = iconImageNamesArray[iconRandomIndex];
        model.weixinName = namesArray[nameRandomIndex];
        model.weixinContent = textArray[contentRandomIndex];
        model.weixinTime = timeArray[picRandomIndex];
        
        [self.dataArray addObject:model];
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    DemoVC5Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[DemoVC5Cell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    }
    
    cell.model = self.dataArray[indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 分区", (long)indexPath.section];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [DemoVC5Cell whc_CellHeightForIndexPath:indexPath tableView:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }
    return 10;
}



@end
