//
//  ViewController.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "ViewController.h"
#import "BAMainDemoCell.h"

static NSString *const CellId = @"cell";
@interface ViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>


@property (nonatomic, strong) UITableView     *tableView;
@property (nonatomic, strong) NSArray         *titlesArray;
@property (nonatomic, strong) NSMutableArray  *classNamesArray;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor redColor];
        
        [_tableView setBackgroundColor:[UIColor clearColor]];
        UIImageView *bgImageView = [[UIImageView alloc] init];
        bgImageView.image = [UIImage imageNamed:@"005.jpg"];
        bgImageView.frame = self.tableView.bounds;
        _tableView.backgroundView = bgImageView;
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
        }];
        
        _tableView.tableFooterView = [UIView new];
        
//        [self creatData];
        
    }
    return _tableView;
}

- (NSArray *)titlesArray
{
    if (!_titlesArray) {
        _titlesArray = @[@"Demo ** 1 **\r\n自定义View(多重嵌套tableView)",
                         @"Demo ** 2 **\r\n微信朋友圈",
                         @"Demo ** 3 **\r\n自适应文字高度",
                         @"Demo ** 4 **\r\n测试tableView",
                         @"Demo ** 5 **\r\n评论界面(WHC)",
                         @"Demo ** 6 **\r\n评论界面(SD)",
                         @"Demo ** 7 **\r\n评论列表",
                         @"Demo ** 8 **\r\n动态该表label的高度",
                         @"Demo ** 9 **\r\nNSString扩展",
                         @"Demo ** 10 **\r\n多级评论",
                         @"Demo ** 11 **\r\n城市选择器(pickView)",
                         @"Demo ** 12 **\r\nalertView封装",
                         @"Demo ** 13 **\r\n文字和APP名字的国际化(webView封装)",
                         @"Demo ** 14 **\r\n自定义collection",
                         @"Demo ** 15 **\r\nMVVM设计模式+自定义navi",
                         @"Demo ** 16 **\r\n友盟分享和登陆",
                         @"Demo ** 17 **\r\nQQ好友分组",
                         @"Demo ** 18 **\r\nruntime测试/gif动画",
                         @"Demo ** 19 **\r\n联系人分组（带索引）",
                         @"Demo ** 20 **\r\n(最简单的)自定义collectionView",
                         @"Demo ** 21 **\r\n自定义绘图",
                         @"Demo ** 22 **\r\n自定义textView",
                         @"Demo ** 23 **\r\nKVC和KVO监测",
                         @"Demo ** 24 **\r\n通知传值(自定义转场动画！)",
                         @"Demo ** 25 **\r\n视频播放器(自适应tabelHeaderView/解决分割线距离顶端15像素的问题)",
                         @"Demo ** 26 **\r\n二维码扫描"
                         ];
        _titlesArray = [[_titlesArray reverseObjectEnumerator] allObjects];
    }
    return _titlesArray;
}

- (NSMutableArray *)classNamesArray
{
    if (!_classNamesArray) {
        _classNamesArray = @[].mutableCopy;
        for (int i = 0; i < self.titlesArray.count; i++)
        {
            NSString *name = [NSString stringWithFormat:@"DemoVC%d",i+1];
            [_classNamesArray addObject:name];
        }
        _classNamesArray = [(NSArray *)[[_classNamesArray reverseObjectEnumerator] allObjects] mutableCopy];
    }
    return _classNamesArray;
}

//- (void)creatData
//{
//    self.titlesArray = @[].mutableCopy;
//    self.classNamesArray = @[].mutableCopy;
//
//    [self addCell:@"1、自定义View(多重嵌套tableView)" class:@"DemoVC1"];
//    [self addCell:@"2、微信朋友圈" class:@"DemoVC2"];
//    [self addCell:@"3、自适应文字高度" class:@"DemoVC3"];
//    [self addCell:@"4、测试tableView" class:@"DemoVC4"];
//    [self addCell:@"5、评论界面(WHC)" class:@"DemoVC5"];
//    [self addCell:@"6、评论界面(SD)" class:@"DemoVC6"];
//    [self addCell:@"7、评论列表" class:@"DemoVC7"];
//    [self addCell:@"8、动态该表label的高度" class:@"DemoVC8"];
//    [self addCell:@"9、NSString扩展" class:@"DemoVC9"];
//    [self addCell:@"10、多级评论" class:@"DemoVC10"];
//    [self addCell:@"11、城市选择器(pickView)" class:@"DemoVC11"];
//    [self addCell:@"12、alertView封装" class:@"DemoVC12"];
//    [self addCell:@"13、文字和APP名字的国际化(webView封装)" class:@"DemoVC13"];
//    [self addCell:@"14、自定义collection" class:@"DemoVC14"];
//
//    [self.tableView reloadData];
//}

//- (void)addCell:(NSString *)title class:(NSString *)className
//{
//    [self.titlesArray addObject:title];
//    [self.classNamesArray addObject:className];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = NSLocalizedString(@"title", nil);
//    self.title = BALocalizedString(@"title", @"博爱Demo测试");
    self.title = BALocalizedString(@"title", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    
    [BAFPSLabel showInWindow:[UIApplication sharedApplication].keyWindow];
    
    self.tableView.hidden = NO;
    
//    [self BA_starYingHuaCoreAnimation];
//    [self BA_starXueHuaCoreAnimation];
//    [self BA_starYanHuaCoreAnimation];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAMainDemoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[BAMainDemoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.backgroundColor = [UIColor clearColor];
//    NSArray *indexArray = 
//    cell.titleLabel.text = [NSString stringWithFormat:@"Demo ** %ld **", (long)indexPath.row];
    cell.contentLabel.text = self.titlesArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = self.classNamesArray[indexPath.row];
    Class class = NSClassFromString(className);
    if (class)
    {
        UIViewController *vc = class.new;
        vc.title = self.titlesArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//- (NSString *)cutLocalStringForShow:(NSString *)iStr
//{
//    // 对显示坐标进行去重
//    NSArray * arr = [iStr componentsSeparatedByString:NSLocalizedString(@"**", nil)];
//    if([arr count] < 2) return iStr;
//    return arr[0];
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        // 此升级版方法适用于cell的model有多个的情况下,性能比普通版稍微差一些,不建议在数据量大的tableview中使用,推荐使用“cellHeightForIndexPath:model:keyPath:cellClass:contentViewWidth:”方法同样是一步设置即可完成
    return [self.tableView cellHeightForIndexPath:indexPath cellContentViewWidth:BA_SCREEN_WIDTH tableView:self.tableView];
}


@end
