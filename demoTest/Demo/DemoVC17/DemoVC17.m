//
//  DemoVC17.m
//  demoTest
//
//  Created by 博爱 on 16/4/8.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC17.h"
#import "BARoundCornerCell.h"

@interface DemoVC17 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titlesArray;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *stateArray;

@end

@implementation DemoVC17

- (UITableView *)tableView
{
    if (!_tableView)
    {
        [self creatData];
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

- (void)creatData
{
    _titlesArray = [NSMutableArray arrayWithObjects:
                    @"计算机/互联网/通信",
                    @"生产/工艺/制造",
                    @"商业/服务业/个体经营",
                    @"金融/银行/投资/保险",
                    @"文化/广告/传媒",
                    @"娱乐/艺术/表演",
                    @"医疗/护理/制药",
                    @"律师/法务",
                    @"教育/培训",
                    @"学生",nil];

    NSArray *one = @[@"工程狮",@"程序猿",@"UI设计师",@"运营人员",@"产品经理",@"策划师",@"市场拓展",@"网站编辑",@"其他"];
    NSArray *two = @[@"管理层",@"技术员",@"检验员",@"质检员",@"就是个工人",@"小组长",@"车间主任",@"其他"];
    NSArray *three = @[@"服务员",@"收银员",@"会计",@"文秘",@"保安大哥",@"销售经理",@"造型师",@"厨师",@"采购员",@"业务经理",@"个体户",@"其他"];
    NSArray *four = @[@"证券分析师",@"操盘手",@"客户经理",@"保险经纪",@"银行职员",@"投资经理",@"理财顾问",@"保险精算师",@"其他"];
    NSArray *five = @[@"作家",@"设计师",@"广告策划",@"主持人",@"编导",@"记者",@"制片人",@"导演",@"草根写手",@"其他"];
    NSArray *six = @[@"歌手",@"模特",@"导演",@"经纪人",@"编剧",@"摄影师",@"音乐人",@"制作人",@"艺术家",@"其实我是一个演员",@"其他"];
    NSArray *seven = @[@"主治医师",@"营养师",@"护士",@"护工",@"美容师",@"医药代表",@"医务工作者",@"药剂师",@"其他"];
    NSArray *eight = @[@"公务员",@"律师",@"警察",@"法官",@"政府工作人员",@"军人",@"其他"];
    NSArray *nine = @[@"幼教",@"教师",@"教授",@"户外拓展",@"讲师",@"教练",@"其他"];
    NSArray *ten = @[@"中学生",@"大学生",@"研究生",@"博士生",@"留学生"];
    
    _dataArray = [NSMutableArray arrayWithObjects:one,two,three,four,five,six,seven,eight,nine,ten, nil];
    _stateArray = [NSMutableArray array];
    
    for (int i = 0; i < self.dataArray.count; i++)
    {
        //所有的分区都是闭合
        [_stateArray addObject:@"0"];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.hidden = NO;
}

#pragma mark - UITableViewDataSource UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titlesArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.stateArray[section] isEqualToString:@"1"])
    {
        // 如果是展开状态
        NSArray *rowArray = self.dataArray[section];
        return rowArray.count;
    }
    else
    {
        // 如果是闭合，返回0
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (!cell)
//    {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
//    }

    BARoundCornerCell *cell = [BARoundCornerCell cellWithTableView:tableView style:UITableViewCellStyleDefault radius:10.0f indexPath:indexPath strokeLineWidth:2 strokeColor:nil];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0
                                           green:arc4random() % 255 / 255.0
                                            blue:arc4random() % 255 / 255.0
                                           alpha:1.0];
    
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    
    if (_dataArray.count!=0)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_dataArray.count!=0)
    {
        NSString *msg = [NSString stringWithFormat:@"你点击了 %ld 分区, 类别为：%@, %ld 行 %@, ", (long)indexPath.section, self.titlesArray[indexPath.section], (long)indexPath.row, self.dataArray[indexPath.section][indexPath.row]];
        BA_SHOW_ALERT(@"温馨提示：", msg);
    }
}

/** 设置section的title */
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titlesArray[section];
}

/** 设置头标题的样式,在button上放的图片,文字.可以用别的方 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [btn setTag:section+1];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 60)];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, btn.frame.size.height-1, btn.frame.size.width, 1)];
    [line setImage:[UIImage imageNamed:@"case_cell_Line"]];
    
    [btn addSubview:line];
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (44-22)/2, 22, 22)];
    [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon-%ld",section+1]]];
    [btn addSubview:imgView];
    
    UIImageView *_imgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-30, (44-6)/2, 10, 6)];
    
    if ([self.stateArray[section] isEqualToString:@"0"]) {
        _imgView.image = [UIImage imageNamed:@"icon-sjt"];
        
    }else if ([self.stateArray[section] isEqualToString:@"1"]) {
        _imgView.image = [UIImage imageNamed:@"icon-xjt"];
        
    }
    [btn addSubview:_imgView];
    
    UILabel *tlabel = [[UILabel alloc]initWithFrame:CGRectMake(40, (44-20)/2, 200, 20)];
    [tlabel setBackgroundColor:[UIColor clearColor]];
    [tlabel setFont:[UIFont systemFontOfSize:16]];
    [tlabel setText:self.titlesArray[section]];
    [btn addSubview:tlabel];
    
    return btn;
}

/** Button点击事件 */
- (IBAction)buttonClick:(UIButton *)sender
{
    if ([self.stateArray[sender.tag - 1] isEqualToString:@"1"])
    {
        [self.stateArray replaceObjectAtIndex:sender.tag - 1 withObject:@"0"];
    }
    else
    {
        [self.stateArray replaceObjectAtIndex:sender.tag - 1 withObject:@"1"];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag - 1] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}





@end
