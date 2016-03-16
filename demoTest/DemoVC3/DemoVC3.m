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
//        UIImageView *bgImageView = [[UIImageView alloc] init];
//        bgImageView.image = [UIImage imageNamed:@"005.jpg"];
//        bgImageView.frame = self.tableView.bounds;
//        _tableView.backgroundView = bgImageView;
        
        _tableView.tableFooterView = [UIView new];
        
        DemoVC2HeadView *headView = [DemoVC2HeadView new];
        headView.frame = CGRectMake(0, 0, 0, 260);
        self.tableView.tableHeaderView = headView;
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
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
    
    NSArray *namesArray = @[@"GSD_iOS",
                            @"风口上的猪",
                            @"当今世界网名都不好起了",
                            @"我叫郭德纲",
                            @"Hello Kitty"];
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"当你的 app 没有提供 3x 的 LaunchImage 时屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。"
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
        return 3;
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section == 0)
    {
        
        DemoVC3Cell *cell1 = [tableView dequeueReusableCellWithIdentifier:kDemoVC3CellId];
        cell1.indexPath = indexPath;
        
        __weak typeof(self) weakSelf = self;
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
                [self clickCollectionBtn];
            }
            if (index == 2)
            {
                [self clickCollectionBtn];
            }
            if (index == 3)
            {
                [self clickCollectionBtn];
            }
            if (index == 4)
            {
                [self clickCollectionBtn];
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
    SHOW_ALERT(@"温馨提示：", @"点击了 关注 按钮！");
}

#pragma mark 收藏
- (void)clickCollectionBtn
{
    SHOW_ALERT(@"温馨提示：", @"点击了 收藏 按钮！");
}

@end
