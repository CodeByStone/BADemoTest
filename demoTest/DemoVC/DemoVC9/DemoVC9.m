//
//  DemoVC9.m
//  demoTest
//
//  Created by 博爱之家 on 16/3/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC9.h"

@interface DemoVC9 ()

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation DemoVC9

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSArray *)titleArray
{
    if (!_titleArray)
    {
        _titleArray = @[[NSString BA_time_getCurrentDateAndTime],
                        [NSString BA_time_getCurrentDateAndTimeWithTimeString:@"1458462423"],
                        [NSString BA_time_getDateWithTimeString:@"1458462423"],
                        [NSString BA_time_getTimeWithTimeString:@"1458462423"],
                        [NSString BA_time_getTimeStamp],
                        @"彩色字体测试",
                        [@"123456" BA_md5String]
                        ];
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
    
    cell.textLabel.numberOfLines = 0;
    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"获得系统当前日期和时间：%@",self.titleArray[indexPath.row]];
    }
    if (indexPath.row == 1)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"时间戳转换成日期和时间：%@",self.titleArray[indexPath.row]];
    }
    if (indexPath.row == 2)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"时间戳转换成日期：%@",self.titleArray[indexPath.row]];
    }
    if (indexPath.row == 3)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"时间戳转换成时间：%@",self.titleArray[indexPath.row]];
    }
    if (indexPath.row == 4)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"系统当前日期和时间转换成时间戳：%@",self.titleArray[indexPath.row]];
    }
    if (indexPath.row == 5)
    {
        NSString *text = @"NSMutableAttributedString: 我的名字是红色的！";
        NSMutableAttributedString *mutableAttriStr = [NSString BA_creatMutableAttributedString:text textColor:[UIColor redColor] bgColor:[UIColor greenColor] font:14 range:NSMakeRange(text.length - 4, 2)];
        cell.textLabel.attributedText = mutableAttriStr;
    }
    if (indexPath.row == 6)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"md5加密测试：%@，【不建议使用MD5加密】目前MD5加密算法已不安全，解密网站【http://www.cmd5.com】",self.titleArray[indexPath.row]];
    }
    
    BALog(@"DemoVC9 打印测试：%@", cell.textLabel.text);
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 6)
    {
        return 100;
    }
    return 45;
}

@end
