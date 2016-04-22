//
//  DemoVC3.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC3.h"
#import "DemoVC3Model.h"
#import "DemoVC3Cell.h"
#import "DemoVC2HeadView.h"

#import "YRDemandShareCell.h"
#import "YRDemandUserViewCell.h"

#define kDemoVC3CellId @"demovc3cell"


@interface DemoVC3 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) YRDemandModelAuthor *authorModel;


@end

@implementation DemoVC3

- (UITableView *)tableView
{
    if (!_tableView)
    {
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        [self creatModelsData];
        
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor redColor];
        
        [_tableView setBackgroundColor:[UIColor whiteColor]];
        
        _tableView.tableFooterView = [UIView new];
        
        DemoVC2HeadView *headView = [DemoVC2HeadView new];
        headView.frame = CGRectMake(0, 0, 0, 260);
        self.tableView.tableHeaderView = headView;
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [self.tableView registerClass:[DemoVC3Cell class] forCellReuseIdentifier:kDemoVC3CellId];

        
    }
    return _tableView;
}

- (YRDemandModelAuthor *)authorModel
{
    if (!_authorModel)
    {
        _authorModel = [YRDemandModelAuthor new];
        _authorModel.nickName = @"博爱";
        _authorModel.desc = @"当今世界网名都不好起了13131";
        _authorModel.headImg = @"http://img2.imgtn.bdimg.com/it/u=3455436431,1347077353&fm=23&gp=0.jpg";
    }
    return _authorModel;
}

- (void)creatModelsData
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    
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
    NSArray *playNumbersArray = @[@"123",
                                     @"223",
                                     @"444",
                                     @"888",
                                     @"123131",
                                     ];
    
    for (int i = 0; i < 10; i++)
    {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
    
        DemoVC3Model *model = [DemoVC3Model new];
        model.title = namesArray[iconRandomIndex];
        model.playNumber = playNumbersArray[nameRandomIndex];
        model.content = textArray[contentRandomIndex];
        
        [self.dataArray addObject:model];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.tableView.hidden = NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    BA_WEAKSELF;
    if (indexPath.section == 0)
    {
        
        DemoVC3Cell *cell1 = [tableView dequeueReusableCellWithIdentifier:kDemoVC3CellId];
        cell1.indexPath = indexPath;
        
        if (!cell1.moreButtonClickBlock)
        {
            [cell1 setMoreButtonClickBlock:^(NSIndexPath *indexPath) {
                
                DemoVC3Model *model = weakSelf.dataArray[indexPath.row];
                model.isOpening = !model.isOpening;
                [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            }];
        }
        cell1.model = self.dataArray[indexPath.row];
        return cell1;
    }
    if (indexPath.section == 1)
    {
        static NSString *cellId = @"YRDemandShareCell";
        YRDemandShareCell *contentShareCell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!contentShareCell)
        {
            contentShareCell = [[YRDemandShareCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        }
        
        [contentShareCell callBackIndex:^(NSInteger index) {
            
            if (index == 1)
            {
                [weakSelf clickCollectionBtn:@"收藏"];
            }
            if (index == 2)
            {
                [weakSelf clickCollectionBtn:@"点赞"];
            }
            if (index == 3)
            {
                [weakSelf clickshareBtn];
            }
            if (index == 4)
            {
                [weakSelf clickCollectionBtn:@"赏"];
            }
        }];
        
        return contentShareCell;
    }
    if (indexPath.section == 2)
    {
        static NSString *cellId1 = @"YRDemandUserViewCell";
        YRDemandUserViewCell *userViewCell = [tableView dequeueReusableCellWithIdentifier:cellId1];
        if (!userViewCell)
        {
            userViewCell = [[YRDemandUserViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId1];
        }
        
        userViewCell.demandDataModel = self.authorModel;
        userViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [userViewCell.attentionButton addTarget:self action:@selector(clickAttentionButton:) forControlEvents:UIControlEventTouchUpInside];
        return userViewCell;
    }
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        // >>>>>>>>>>>>>>>>>>>>> * cell自适应 * >>>>>>>>>>>>>>>>>>>>>>>>
        id model = self.dataArray[indexPath.row];
        return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[DemoVC3Cell class] contentViewWidth:[self cellContentViewWith]];
    }
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
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

#pragma mark 关注
- (IBAction)clickAttentionButton:(UIButton *)sender
{
    BA_SHOW_ALERT(@"温馨提示：", @"点击了 关注 按钮！");
}

#pragma mark 收藏
- (void)clickCollectionBtn:(NSString *)title
{
    NSString *msg = [NSString stringWithFormat:@"点击了 %@ 按钮！", title];
    BA_SHOW_ALERT(@"温馨提示：", msg);
}

#pragma mark 分享
- (void)clickshareBtn
{
    NSString *shareText = @"测试（博爱demo）分享【博爱之家】！";
    UIImage *shareImage = [UIImage imageNamed:@"005.jpg"];
    NSString *urlSrt = @"http://www.cnblogs.com/boai/";
    
    BAShareManage *manger = [BAShareManage shareManage];
    [manger BA_UMshareListWithViewControll:self withShareText:shareText image:shareImage url:urlSrt];
}

@end
