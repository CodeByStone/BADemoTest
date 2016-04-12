//
//  DemoVC19.m
//  demoTest
//
//  Created by 博爱 on 16/4/11.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC19.h"
#import "BAChineseString.h"

@interface DemoVC19 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *indexArray;
// 设置每个section下的cell内容
@property (nonatomic, strong) NSMutableArray *LetterResultArr;

@property (nonatomic, strong) NSArray *namesArray;

@end

@implementation DemoVC19


- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0 , 0, 0, 0));
        }];
        
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}

- (NSArray *)namesArray
{
    if (!_namesArray)
    {
        _namesArray = [NSArray arrayWithObjects:
                        @"boai",@" ￥Chin ese ",@"广州 ",@"上海",
                        @"北京",@"河北",@"陕西",@"传播",
                        @"2016",@"2015",@"000",@"中国",@"博爱的demo",
                        @"联系人", @"hello",@"world",
                        nil];
    }
    return _namesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 首先要导入框架：CoreGraphics.framework
    
    self.tableView.hidden = NO;
    
    self.indexArray = [BAChineseString BA_IndexArray:self.namesArray];
    self.LetterResultArr = [BAChineseString BA_LetterSortArray:self.namesArray];
}

#pragma mark - Section的Header的值
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *key = [self.indexArray objectAtIndex:section];
    return key;
}

#pragma mark - Section header view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 可以完全自定义
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, BA_SCREEN_WIDTH, 20)];
    label.backgroundColor = BA_Green_Color;
    label.text = self.indexArray[section];
    label.textColor = BA_Red_Color;
    
    return label;
}

#pragma mark - row height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

#pragma mark -
#pragma mark Table View Data Source Methods
#pragma mark - 设置右方表格的索引数组
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.indexArray;
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    BALog(@"title === %@",title);
    return index;
}

#pragma mark - 允许数据源告知必须加载到Table View中的表的Section数。
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.indexArray count];
}

#pragma mark - 设置表格的行数为数组的元素个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.LetterResultArr[section] count];
}

#pragma mark - 每一行的内容为数组相应索引的值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.LetterResultArr[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - Select内容为数组相应索引的值
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *msg = self.LetterResultArr[indexPath.section][indexPath.row];;
    
    BA_SHOW_ALERT(@"温馨提示：", msg);
}

@end
