//
//  DemoVC5_SearchVC.m
//  demoTest
//
//  Created by 博爱 on 16/3/28.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC5_SearchVC.h"
#import "BATokenManager.h"
#import "BASearchBar.h"

#define fontCOLOR [UIColor colorWithRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:1]

@interface DemoVC5_SearchVC ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) BASearchBar * searchBar;

@property (nonatomic, strong) NSMutableArray * searchHistory;
@property (nonatomic, strong) NSArray *myArray;//搜索记录的数组


@end

@implementation DemoVC5_SearchVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    [self readNSUserDefaults];
}
-(void)viewDidLoad{
    
    _searchHistory = [NSMutableArray array];
    
    [self creatNaviSearch];
}

- (void)creatNaviSearch
{
    CGRect searchBarFrame = CGRectMake(BA_SCREEN_WIDTH - 110, BA_STATUSBAR_HEIGHT + 5,  100, 35);
    self.searchBar = [[BASearchBar alloc] initWithFrame:searchBarFrame];
    self.searchBar.placeholder = @"搜索名字、视频";
        
    BACustomBarItem *centerNaviItem = [self.navigationItem setItemWithCustomView:self.searchBar itemType:right];
    
    [centerNaviItem setOffset:0];
    
    _searchHistory = [NSMutableArray array];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //    self.myTableView.backgroundColor = BGCOLOR;
    self.searchBar.returnKeyType = UIReturnKeySearch;//更改键盘的return
    self.searchBar.delegate = self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{//搜索方法
    if (textField.text.length > 0) {
        
        [BATokenManager SearchText:textField.text];//缓存搜索记录
        [self readNSUserDefaults];
        
    }else{
        BALog(@"请输入查找内容");
    }
    
    return YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        if (_myArray.count>0) {
            return _myArray.count+1+1;
        }else{
            return 1;
        }
    }else{
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if(indexPath.row ==0){
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            cell.textLabel.text = @"历史搜索";
            cell.textLabel.textColor = fontCOLOR;
            return cell;
        }else if (indexPath.row == _myArray.count+1){
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            cell.textLabel.text = @"清除历史记录";
            cell.textLabel.textColor = fontCOLOR;
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            return cell;
        }else{
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            NSArray* reversedArray = [[_myArray reverseObjectEnumerator] allObjects];
            cell.textLabel.text = reversedArray[indexPath.row-1];
            return cell;
        }
    }else{
        UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }else{
        return 10;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.tableView.estimatedRowHeight = 44.0f;
    //    self.searchTableView.estimatedRowHeight = 44.0f;
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == _myArray.count+1) {//清除所有历史记录
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"清除历史记录" message:@"" preferredStyle: UIAlertControllerStyleAlert];
        
        //@“ UIAlertControllerStyleAlert，改成这个就是中间弹出"
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [BATokenManager removeAllArray];
            _myArray = nil;
            [self.tableView reloadData];
        }];
        //            UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:deleteAction];
        //            [alertController addAction:archiveAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        
    }
}


-(void)readNSUserDefaults{//取出缓存的数据
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray * myArray = [userDefaultes arrayForKey:@"myArray"];
    self.myArray = myArray;
    [self.tableView reloadData];
    BALog(@"myArray======%@",myArray);
}
@end
