//
//  DemoVC20.m
//  demoTest
//
//  Created by 博爱 on 16/4/19.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC20.h"
#import "YRHomeTopView.h"

@interface DemoVC20 ()

@property (nonatomic, strong) YRHomeTopView  *homeTopView;
@property (nonatomic, strong) NSArray        *dataArr;

@end

@implementation DemoVC20

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatData];
    
    self.view.backgroundColor = BA_BGGrayColor;
    
    self.homeTopView.hidden = NO;

}

- (void)creatData
{
    if (!_dataArr)
    {
        _dataArr = @[
                     @{
                         @"btnTitle":@"cell1",
                         @"btnImageName":@"icon0.jpg"},
                     @{
                         @"btnTitle":@"cell2",
                         @"btnImageName":@"icon1.jpg"},
                     @{
                         @"btnTitle":@"cell3",
                         @"btnImageName":@"icon2.jpg"},
                     @{
                         @"btnTitle":@"cell4",
                         @"btnImageName":@"icon3.jpg"},
                     @{
                         @"btnTitle":@"cell5",
                         @"btnImageName":@"icon0.jpg"},
                     @{
                         @"btnTitle":@"cell6",
                         @"btnImageName":@"icon1.jpg"},
                     @{
                         @"btnTitle":@"cell7",
                         @"btnImageName":@"icon2.jpg"},
                     @{
                         @"btnTitle":@"cell8",
                         @"btnImageName":@"icon3.jpg"}
                     ];
    }
}

- (YRHomeTopView *)homeTopView
{
    if (!_homeTopView)
    {
        CGRect frame = CGRectMake(0, self.view.centerY - 200, BA_SCREEN_WIDTH, 200);
        
        _homeTopView = [[YRHomeTopView alloc] initWithFrame:frame withDataArray:_dataArr withBlock:^(UICollectionView *collectionView, NSIndexPath *indexPath, NSArray *dataArray) {
            NSLog(@"点击的item---%zd",indexPath.item);
            
        }];
        _homeTopView.backgroundColor = BA_Green_Color;
        [self.view addSubview:_homeTopView];
    }
    return _homeTopView;
}


@end
