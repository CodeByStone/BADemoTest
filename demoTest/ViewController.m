//
//  ViewController.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "ViewController.h"
#import "BAHeader.h"
#import "DemoVC1.h"
#import "DemoVC2.h"
#import "DemoVC3.h"


@interface ViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (!_tableView)
    {
        [self setUpTitleArray];
        
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
    }
    return _tableView;
}

- (void)setUpTitleArray
{
    self.titleArray = @[@"收入排行榜", @"微信朋友圈", @"自适应文字高度", @"此功能暂未开放"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"博爱demo测试";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.hidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
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
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0)
    {
        DemoVC1 *testVC1 = [[DemoVC1 alloc] init];
        testVC1.title = self.titleArray[indexPath.row];
        [self.navigationController pushViewController:testVC1 animated:YES];
    }
    if (indexPath.row == 1)
    {
        DemoVC2 *testVC2 = [[DemoVC2 alloc] init];
        testVC2.title = self.titleArray[indexPath.row];
        [self.navigationController pushViewController:testVC2 animated:YES];
    }
    if (indexPath.row == 2)
    {
        DemoVC3 *testVC3 = [[DemoVC3 alloc] init];
        testVC3.title = self.titleArray[indexPath.row];
        [self.navigationController pushViewController:testVC3 animated:YES];
    }
    
}


@end
