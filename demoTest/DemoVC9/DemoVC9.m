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
        _titleArray = @[[NSString getCurrentDateAndTime],
                        [NSString getCurrentDateAndTimeWithTimeString:@"1458462423"],
                        [NSString getDateWithTimeString:@"1458462423"],
                        [NSString getTimeWithTimeString:@"1458462423"],
                        [NSString getTimeStamp],
                        @"彩色字体测试"
                        
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
        cell.textLabel.text = [NSString stringWithFormat:@"%@",self.titleArray[indexPath.row]];
        //        cell.textLabel.text = [NSString getColorWithLabel:cell.textLabel WithString:self.titleArray[indexPath.row] andColor:[UIColor greenColor]];
    }
    
    return cell;
    
}

@end
