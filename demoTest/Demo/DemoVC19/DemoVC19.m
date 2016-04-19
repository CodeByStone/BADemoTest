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
    UITableViewDataSource,
    /*! 搜索 */
    UISearchBarDelegate,
    UISearchResultsUpdating
>

@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *indexArray;
// 设置每个section下的cell内容
@property (nonatomic, strong) NSMutableArray *LetterResultArr;

@property (nonatomic, strong) NSArray *namesArray;

/*! 搜索 */
@property (nonatomic, strong) UISearchController * searchController;
@property (nonatomic, strong) NSMutableArray * searchList;

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
    
    self.searchList = [[NSMutableArray alloc]init];
    
    //初始化数据
//    for(char c = 'A'; c <= 'Z'; c++ )
//    {
////        [_dataList addObject:[NSString stringWithFormat:@"%c",c]];
//        [_dataBase addObject:[[NSString stringWithFormat:@"%c",c] lowercaseString]];
//        [_dataBase addObject:[[NSString stringWithFormat:@"%c",c] lowercaseString]];
//        [_dataBase addObject:[[NSString stringWithFormat:@"%c",c] lowercaseString]];
//    }

    /*! 索引 */
    self.indexArray = [BAChineseString BA_IndexArray:self.namesArray];
    /*! 排序后的联系人数组 */
    self.LetterResultArr = [BAChineseString BA_LetterSortArray:self.namesArray];
    
    [self createSearchBar];

}

#pragma mark - 搜索
/*! createSearchBar */
- (void)createSearchBar
{
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.hidesNavigationBarDuringPresentation = NO;
    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleProminent;
    
    self.searchController.searchBar.keyboardType = UIKeyboardTypeDefault;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.tableView.allowsSelection = YES;
    self.tableView.scrollEnabled = YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //
    //    NSArray *results;
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    self.tableView.allowsSelection=YES;
    self.tableView.scrollEnabled=YES;
    //
    //    [self.dataList removeAllObjects];
    //    [self.dataList addObjectsFromArray:results];
    //
    //    [self.tableView reloadData];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchBar.text];
    if (self.searchList!= nil) {
        [self.searchList removeAllObjects];
    }
    //过滤数据
    self.searchList= [NSMutableArray arrayWithArray:[_indexArray filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    NSLog(@"搜索begin");
    
    self.searchController.searchBar.showsCancelButton = YES;
    
    
    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    NSLog(@"搜索end");
    
    //刷新表格
    [self.tableView reloadData];
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    
    
    return YES;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    NSString *searchString = [self.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    if (self.searchList!= nil) {
        [self.searchList removeAllObjects];
    }
    
    //过滤数据
    self.searchList= [NSMutableArray arrayWithArray:[_LetterResultArr filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableView reloadData];
}


#pragma mark - Section的Header的值
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.searchController.active)
    {
        return [[_searchList objectAtIndex:section] uppercaseString];
    }
    else
    {
        NSString *key = [self.indexArray objectAtIndex:section];
        return key;
    }
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
//    BALog(@"title === %@",title);
//    return index;
    
    NSInteger count = 0;
    
    NSLog(@"%@-%ld",title,(long)index);
    
    for(NSString *character in self.indexArray)
    {
        if([character isEqualToString:title])
        {
            return count;
        }
        count ++;
    }
    
    return index;
}

#pragma mark - 允许数据源告知必须加载到Table View中的表的Section数。
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.searchController.active)
    {
        return [self.searchList count];
    }
    else
    {
        return [self.indexArray count];
    }
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
    
    if (self.searchController.active)
    {
        [cell.textLabel setText:self.searchList[indexPath.row]];
    }
    else
    {
        cell.textLabel.text = self.LetterResultArr[indexPath.section][indexPath.row];
    }
    
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
