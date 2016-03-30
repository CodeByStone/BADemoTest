//
//  DemoVC14.m
//  demoTest
//
//  Created by 博爱 on 16/3/30.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC14.h"
#import "BACardLayout.h"

@interface DemoVC14 ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView *collectionView;
// 存放img名字的数组;
@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation DemoVC14

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = BA_White_Color;
    
    [self creatData];
    self.collectionView.hidden = NO;
}

- (void)creatData
{
    self.imageArray = @[].mutableCopy;
    for (int i = 0; i < 14; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"img%d.jpg", i];
        [self.imageArray addObject:imageName];
    }
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        BACardLayout *flowLayout = [[BACardLayout alloc] init];
        
        CGRect frame = self.view.bounds;
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        //提前注册
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark -- collectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = BA_White_Color;
    
    // 先清空subviews 防止重影 有更好的方法一定要告诉我
    for (UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    
    CGRect frame = CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.layer.shadowColor = BA_White_Color.CGColor;
    imageView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    imageView.layer.shadowRadius = 5;
    imageView.layer.shadowOpacity = 0.8;
    imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    
    // 一定要添加到cell.contentView上
    [cell.contentView addSubview:imageView];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s,你点击了第%ld个item！", __func__, (long)indexPath.row);
}




















@end
