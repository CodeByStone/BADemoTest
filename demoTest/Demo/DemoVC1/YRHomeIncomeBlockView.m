 //
//  YRHomeIncomeBlockView.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "YRHomeIncomeBlockView.h"
#import "BAHomeIncomeModel.h"
#import "BAHomeIncomeCell.h"

@interface YRHomeIncomeBlockView ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy)   selectRowBlock selectBlock;
@property (nonatomic, strong) NSMutableArray *modelsArray;


@end

@implementation YRHomeIncomeBlockView

- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock
{
    if (self = [super initWithFrame:frame])
    {
        self.selectBlock = selectRowBlock;
        [self creatModelData];
        
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds];
        self.tableView.backgroundColor = [UIColor clearColor];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        [self addSubview:self.tableView];
        
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)creatModelData
{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray new];
    }
    
    YRHomeIncomeModelData *model1 = [YRHomeIncomeModelData new];
    model1.headImg = @"005.jpg";
    model1.nickName = @"博爱1";
    model1.score = @"1222222";
    
    YRHomeIncomeModelData *model2 = [YRHomeIncomeModelData new];
    model2.headImg = @"005.jpg";
    model2.nickName = @"博爱2";
    model2.score = @"121313";
    
    YRHomeIncomeModelData *model3 = [YRHomeIncomeModelData new];
    model3.headImg = @"005.jpg";
    model3.nickName = @"博爱3";
    model3.score = @"4546464";
    
    [self.modelsArray addObject:model1];
    [self.modelsArray addObject:model2];
    [self.modelsArray addObject:model3];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BAHomeIncomeCell *cell = [BAHomeIncomeCell theBAHomeIncomeCellWithTableView:tableView];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.dataModel = self.modelsArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 点击立刻取消该cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectBlock(tableView, indexPath, self.modelsArray);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}


@end
