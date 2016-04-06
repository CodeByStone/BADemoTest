//
//  DemoVC15.m
//  demoTest
//
//  Created by 博爱 on 16/4/6.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC15.h"

// model类
#import "DemoVC15Model.h"
#import "DemoVC15_ViewModel.h"

// view类
#import "DemoVC15Cell.h"

// VC类
#import "DemoVC7_replyVC.h"


@interface DemoVC15 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
/*！ viewModel:DemoVC15_ViewModel */
@property (nonatomic, strong) NSMutableArray *statusFrames;

@end

@implementation DemoVC15

- (UITableView *)tableView
{
    if (!_tableView)
    {
        
        [self creatModelsData];
        
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
        }];
        
        _tableView.tableFooterView = [UIView new];
        self.tableView.rowHeight = 100;
        
    }
    return _tableView;
}

- (NSMutableArray *)statusFrames
{
    if (!_statusFrames)
    {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
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
    
    NSArray *picImageNamesArray = @[ @"1",
                                     @"2",
                                     @"3",
                                     @"4",
                                     @"5",
                                     ];
    
    NSArray *supportNumberArray = @[ @"111",
                                     @"222",
                                     @"3333",
                                     @"444",
                                     @"555",
                                     ];
    NSArray *timeArray = @[@"2016-03-06",@"2016-03-07",@"2016-03-08",@"2016-03-09",@"2016-03-10"];
    
    for (int i = 0; i < 100; i++)
    {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        int picRandomIndex = arc4random_uniform(5);
        
        DemoVC15Model *model  = [DemoVC15Model new];
        model.imageName       = iconImageNamesArray[iconRandomIndex];
        model.userName        = namesArray[nameRandomIndex];
        model.content         = textArray[contentRandomIndex];
        model.time            = timeArray[picRandomIndex];
        model.starNumber      = picImageNamesArray[picRandomIndex];
        model.supportNumber   = supportNumberArray[picRandomIndex];
        
        [self.dataArray addObject:model];
    }
    
    // 模型转换视图模型 DemoVC15Model -> DemoVC15_ViewModel
    NSMutableArray *statusF = [NSMutableArray array];
    
    for (DemoVC15Model *model in self.dataArray)
    {
        DemoVC15_ViewModel *subViewFrame = [[DemoVC15_ViewModel alloc] init];
        subViewFrame.model = model;
        [statusF addObject:subViewFrame];
    }
    
    [self.statusFrames addObjectsFromArray:statusF];
    BALog(@"self.statusFrames : %@", self.statusFrames);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.hidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    DemoVC15Cell *cell = [DemoVC15Cell cellWithTableView:tableView];
    // 获取DemoVC15_ViewModel模型
    DemoVC15_ViewModel *subViewFrame = self.statusFrames[indexPath.row];
    
    // 给cell传递模型
    cell.subViewFrame = subViewFrame;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DemoVC7_replyVC *replyVC = [[DemoVC7_replyVC alloc] init];
    replyVC.quesstionDataModel = self.dataArray[indexPath.section];
    [self.navigationController pushViewController:replyVC animated:YES];
}

// 返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取DemoVC15_ViewModel模型
    DemoVC15_ViewModel *subViewFrame = self.statusFrames[indexPath.row];
    
    return subViewFrame.cellHeight;
}


@end
