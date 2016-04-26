//
//  DemoVC25.m
//  demoTest
//
//  Created by 博爱 on 16/4/25.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC25.h"
//#import "WMPlayer.h"
#import "DemoVC25_DetailVC.h"
//#import "VideoModel.h"

@interface DemoVC25 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
{
//    WMPlayer *wmPlayer;
//    NSMutableArray *dataSource;

}

@property (nonatomic, strong) UITableView     *tableView;
@property (nonatomic, strong) NSArray         *titlesArray;
//@property (nonatomic, strong) NSArray         *urlsArray;
@property (nonatomic, strong) NSMutableArray  *dataArray;

@end

@implementation DemoVC25

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor redColor];
        
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
        _titlesArray = @[@"1、第一个视频",
                         @"2、第二个视频"
                         ];
    }
    return _titlesArray;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoVC25_DetailVC *detailVC = [[DemoVC25_DetailVC alloc]init];
    detailVC.URLString  = @"http://yycloudvod1932283664.26702.bs2.yy.com/djk3NTI2MTI0M2RkNDAzMjJkMWJlNmIzNDI4OWU2NTEwMTI1Njc3Mjcy";
    detailVC.title = self.titlesArray[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
