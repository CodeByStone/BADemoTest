//
//  DemoVC11.m
//  demoTest
//
//  Created by 博爱 on 16/3/28.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC11.h"
#import "BAPickerView.h"

@interface DemoVC11 ()
<
    BAPickerViewDelegate
>

@property (nonatomic, strong) BAPickerView *cityPickView;
@property (nonatomic, strong) NSString *resultString;

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, assign) NSIndexPath *selectIndexPath;

@end

@implementation DemoVC11

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSArray *)titleArray
{
    if (!_titleArray)
    {
        self.resultString = @"点击行选择";
        _titleArray = @[self.resultString]
                        ;
    }
    return _titleArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    }
    self.selectIndexPath = indexPath;
    if (indexPath.row == 0)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"城市选择器：%@",self.resultString];
    }
//    if (indexPath.row == 1)
//    {
//        cell.textLabel.text = [NSString stringWithFormat:@"时间戳转换成日期和时间：%@",self.titleArray[indexPath.row]];
//    }
//    if (indexPath.row == 2)
//    {
//        cell.textLabel.text = [NSString stringWithFormat:@"时间戳转换成日期：%@",self.titleArray[indexPath.row]];
//    }
//    if (indexPath.row == 3)
//    {
//        cell.textLabel.text = [NSString stringWithFormat:@"时间戳转换成时间：%@",self.titleArray[indexPath.row]];
//    }
//    if (indexPath.row == 4)
//    {
//        cell.textLabel.text = [NSString stringWithFormat:@"系统当前日期和时间转换成时间戳：%@",self.titleArray[indexPath.row]];
//    }
//    if (indexPath.row == 5)
//    {
//        NSString *text = @"NSMutableAttributedString: 我的名字是红色的！";
//        NSMutableAttributedString *mutableAttriStr = [NSString BA_creatMutableAttributedString:text textColor:[UIColor redColor] bgColor:[UIColor greenColor] font:14 range:NSMakeRange(text.length - 4, 2)];
//        cell.textLabel.attributedText = mutableAttriStr;
//    }
//    if (indexPath.row == 6)
//    {
//        cell.textLabel.text = [NSString stringWithFormat:@"md5加密测试：%@，【不建议使用MD5加密】目前MD5加密算法已不安全，解密网站【http://www.cmd5.com】",self.titleArray[indexPath.row]];
//    }
    
    BALog(@"DemoVC11 打印测试：%@", cell.textLabel.text);
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [self creatCityPickView];
    }
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)creatCityPickView
{
    _cityPickView = [[BAPickerView alloc]init];
    _cityPickView.frame = CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT + 20);
    _cityPickView.delegate = self;
    [self.view addSubview:_cityPickView];
}

- (void)getSelectCity:(NSString *)city
{
    self.resultString = [NSString stringWithFormat:@"已选择city【%@】", city];
    [self.tableView reloadRowsAtIndexPaths:@[self.selectIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}




@end
