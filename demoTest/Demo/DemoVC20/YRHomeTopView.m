//
//  YRHomeTopView.m
//  自定义layout
//
//  Created by 博爱 on 16/4/19.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "YRHomeTopView.h"
#import "BAPhotoCell.h"
#import "BALayout.h"


static NSString *identify = @"cell";

@interface YRHomeTopView ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource
>


@end

@implementation YRHomeTopView

- (instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)dataArray withBlock:(selectItemBlock )seled
{
    if (self = [super init])
    {
        self.frame = frame;
        self.selected = seled;
        self.topViewDataArr = dataArray;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{    
    self.backgroundColor = [UIColor greenColor];
    self.collectionView.hidden = NO;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        BALayout *layout = [BALayout new];
        layout.itemSize = CGSizeMake(self.frame.size.width/3, self.frame.size.height);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_collectionView];
        
        // 隐藏水平滚动条
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.scrollEnabled = YES;
        [self.collectionView registerClass:[BAPhotoCell class] forCellWithReuseIdentifier:identify];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource
// 定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.topViewDataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BAPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.topViewDataArr[indexPath.item][@"btnImageName"]];
    cell.title.text = self.topViewDataArr[indexPath.item][@"btnTitle"];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selected)
    {
        self.selected(_collectionView, indexPath, self.topViewDataArr);
    }
}


@end
