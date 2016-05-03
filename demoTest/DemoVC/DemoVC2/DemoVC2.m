//
//  DemoVC2.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC2.h"
#import "DemoVC2Model.h"
#import "DemoVC2HeadView.h"
#import "DemoVC2Cell.h"

@interface DemoVC2 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>


@property (nonatomic, strong) UITableView     *tableView;
@property (nonatomic, strong) NSMutableArray  *modelsArray;

@end

@implementation DemoVC2


- (UITableView *)tableView
{
    if (!_tableView)
    {
        [self creatModelsWithCount:10];
        self.automaticallyAdjustsScrollViewInsets = NO;

        
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor redColor];
        
        [_tableView setBackgroundColor:[UIColor clearColor]];
        UIImageView *bgImageView = [[UIImageView alloc] init];
        bgImageView.image = [UIImage imageNamed:@"005.jpg"];
        bgImageView.frame = self.tableView.bounds;
        _tableView.backgroundView = bgImageView;
        
        _tableView.tableFooterView = [UIView new];
        
        DemoVC2HeadView *headView = [DemoVC2HeadView new];
        headView.frame = CGRectMake(0, 0, 0, 260);
        self.tableView.tableHeaderView = headView;

        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return _tableView;
}

- (void)creatModelsWithCount:(NSInteger)count
{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray new];
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
    
    NSArray *picImageNamesArray = @[ @"pic0.jpg",
                                     @"pic1.jpg",
                                     @"pic2.jpg",
                                     @"pic3.jpg",
                                     @"pic4.jpg",
                                     @"pic5.jpg",
                                     @"pic6.jpg",
                                     @"pic7.jpg",
                                     @"pic8.jpg"
                                     ];
    
    for (int i = 0; i < count; i++) {
        int iconRandomIndex = arc4random_uniform(5);
        int nameRandomIndex = arc4random_uniform(5);
        int contentRandomIndex = arc4random_uniform(5);
        
        DemoVC2Model *model = [DemoVC2Model new];
        model.iconName = iconImageNamesArray[iconRandomIndex];
        model.name = namesArray[nameRandomIndex];
        model.content = textArray[contentRandomIndex];
        
        
        // 模拟“随机图片”
        int random = arc4random_uniform(10);
        
        NSMutableArray *temp = [NSMutableArray new];
        for (int i = 0; i < random; i++) {
            int randomIndex = arc4random_uniform(9);
            [temp addObject:picImageNamesArray[randomIndex]];
        }
        if (temp.count) {
            model.picNamesArray = [temp copy];
        }
        
        [self.modelsArray addObject:model];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.hidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    DemoVC2Cell *cell = [[DemoVC2Cell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    cell.indexPath = indexPath;
    
    __weak typeof(self) weakSelf = self;
    if (!cell.moreButtonClickedBlock)
    {
        [cell setMoreButtonClickedBlock:^(NSIndexPath *indexPath) {
            DemoVC2Model *model = weakSelf.modelsArray[indexPath.row];
            model.isOpening = !model.isOpening;
            [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
    }
    cell.model = self.modelsArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.modelsArray[indexPath.row];
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[DemoVC2Cell class] contentViewWidth:[self cellContentViewWith]];
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
