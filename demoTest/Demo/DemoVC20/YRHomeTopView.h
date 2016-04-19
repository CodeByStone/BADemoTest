//
//  YRHomeTopView.h
//  自定义layout
//
//  Created by 博爱 on 16/4/19.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectItemBlock)(UICollectionView *collectionView, NSIndexPath *indexPath, NSArray *dataArray);

@interface YRHomeTopView : UIView

@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) NSArray           *topViewDataArr;
@property (nonatomic, copy  ) selectItemBlock    selected;


- (instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)dataArray withBlock:(selectItemBlock )seled;


@end
