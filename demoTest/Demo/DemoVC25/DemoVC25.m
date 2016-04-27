//
//  DemoVC25.m
//  demoTest
//
//  Created by 博爱 on 16/4/25.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC25.h"
#import "DemoVC25_DetailVC.h"
#import "DemoVC25_DetailVC2.h"

@interface DemoVC25 ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView     *tableView;
@property (nonatomic, strong) NSArray         *titlesArray;
//@property (nonatomic, strong) NSArray         *urlsArray;
@property (nonatomic, strong) NSMutableArray  *dataArray;
@property (nonatomic, strong) UIView          *headView;
@property (strong, nonatomic) UILabel         *label;


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
    }
    return _tableView;
}

- (UIView *)headView
{
    if (!_headView)
    {
        _headView = [UIView new];
        _headView.backgroundColor = [UIColor yellowColor];
        
        UILabel *label = [UILabel new];
        label.numberOfLines = 3;
        label.text = @"iPhone SE 采用了备受欢迎的设计，并让它更加出色。铝金属表面经过喷砂工艺处理，打造出绸缎般的质感，让这款小巧、轻便的手机握持时手感非常舒适。绚丽的 4 英寸1 Retina 显示屏让图像显得生动、锐利。倒角边缘经过哑光处理，不锈钢 Apple 标志的颜色也与机身相配，整个外观显得格外精致。";
        _label = label;
        // 文字内容Frame
//        CGFloat textX = _headView.x;
//        CGFloat textY = _headView.top;
//        CGFloat textW = BA_SCREEN_WIDTH - 2 * 10;
//        CGRect textSize = [label.text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:BA_FontSize(14)} context:nil];
//        
//        _label.frame = (CGRect){{textX,textY},textSize.size};
        
        // 按钮
        UIButton *moreBtn = [UIButton new];
        [moreBtn setTitle:@"全部" forState:UIControlStateNormal];
        [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside ];
        moreBtn.selected = YES;
        moreBtn.backgroundColor = BA_Red_Color;
        [moreBtn setCornerRadius:5];
//        moreBtn.frame = CGRectMake(BA_SCREEN_WIDTH - 50, _label.bottom + 15, 40, 20);
        
        // 添加到headView
        [_headView addSubview:moreBtn];
        [_headView addSubview:label];

//        _headView.frame = CGRectMake(0, 0, BA_SCREEN_WIDTH, moreBtn.bottom + 10);
//        [_headView layoutIfNeeded]; // 调用这个方法之后有frame才能加入headView
        
        //////////////////////////////    开始布局  /////////////////////////////////////////
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(_headView);
        }];
        
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.mas_bottom).offset(10);
            make.right.equalTo(label).offset(-10);
        }];
        
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(BA_SCREEN_WIDTH);
            make.bottom.mas_equalTo(moreBtn).offset(10); // 实现动态调整headview的高度
        }];
        
        [_headView layoutIfNeeded]; // 调用这个方法之后有frame才能加入headView
    }
    return _headView;
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.hidden = NO;
    self.tableView.tableHeaderView = self.headView;

    /*! 
     
     在ios7中，UITableViewCell左侧会有默认15像素的空白。这时候，设置setSeparatorInset:UIEdgeInsetsZero 能将空白去掉。
     但是在ios8中，设置setSeparatorInset:UIEdgeInsetsZero 已经不起作用了。下面是解决办法
     1、首先在viewDidLoad方法加入以下代码：
     2、在- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath的代理方法中加入以下代码。。。
     */
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
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
    if (indexPath.row == 0)
    {
        DemoVC25_DetailVC *detailVC = [[DemoVC25_DetailVC alloc]init];
        detailVC.URLString  = @"http://yycloudvod1932283664.26702.bs2.yy.com/djk3NTI2MTI0M2RkNDAzMjJkMWJlNmIzNDI4OWU2NTEwMTI1Njc3Mjcy";
        detailVC.title = self.titlesArray[indexPath.row];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    if (indexPath.row == 1)
    {
        DemoVC25_DetailVC2 *detailVC = [[DemoVC25_DetailVC2 alloc]init];
        detailVC.URLString  = @"http://yycloudvod1932283664.26702.bs2.yy.com/djk3NTI2MTI0M2RkNDAzMjJkMWJlNmIzNDI4OWU2NTEwMTI1Njc3Mjcy";
        detailVC.title = self.titlesArray[indexPath.row];
        [self.navigationController pushViewController:detailVC animated:YES];
    }

    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*! 2、然后在UITableView的代理方法中加入以下代码 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}



/*! 监听按钮点击切换显示的行数 */
- (IBAction)moreBtnClick:(UIButton *)sender
{
    self.label.numberOfLines = self.label.numberOfLines == 0? 3:0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tableView.tableHeaderView = self.headView;
    });
}




@end
