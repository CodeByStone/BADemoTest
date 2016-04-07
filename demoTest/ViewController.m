//
//  ViewController.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, strong) NSMutableArray *classNamesArray;
@property (nonatomic, strong) NSDictionary *dict;

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
        _titlesArray = @[@"1、自定义View(多重嵌套tableView)",
                         @"2、微信朋友圈",
                         @"3、自适应文字高度",
                         @"4、测试tableView",
                         @"5、评论界面(WHC)",
                         @"6、评论界面(SD)",
                         @"7、评论列表",
                         @"8、动态该表label的高度",
                         @"9、NSString扩展",
                         @"10、多级评论",
                         @"11、城市选择器(pickView)",
                         @"12、alertView封装",
                         @"13、文字和APP名字的国际化(webView封装)",
                         @"14、自定义collection",
                         @"15、MVVM设计模式",
                         @"16、友盟分享和登陆",
                         ];
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
    self.title = BALocalizedString(@"title", @"博爱Demo测试");
    self.title = BALocalizedString(@"title", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    
    [BAFPSLabel showInWindow:[UIApplication sharedApplication].keyWindow];
    
    self.tableView.hidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.titlesArray[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
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


@end
