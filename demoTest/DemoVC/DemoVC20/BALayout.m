//
//  BALayout.m
//  自定义layout
//
//  Created by 博爱 on 16/4/12.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BALayout.h"

@implementation BALayout

/**
 *  collectionView的显示范围发生改变的时候，调用下面这个方法是否重新刷新
 *
 *  @param newBounds
 *
 *  @return 是否重新刷新
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 *  布局的初始化操作
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    // 设置为水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置内边距
    CGFloat insetGap = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, insetGap, 0, insetGap);
//    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);

}

/**
 *  设置cell的显示大小
 *
 *  @param rect 范围
 *
 *  @return 返回所有元素的布局
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 获取计算好的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // collectionView中心点的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    // 对原有布局进行调整
    for (UICollectionViewLayoutAttributes *attribute in array)
    {
        // cell的中点X 与 collectionView中心点的X间距
        CGFloat gapx = ABS(attribute.center.x - centerX);
        
        // 根据间距值计算 cell的缩放比例
        CGFloat scale = 1 - gapx / self.collectionView.frame.size.width;
        
        // 设置缩放比例
        attribute.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return array;
}


@end
