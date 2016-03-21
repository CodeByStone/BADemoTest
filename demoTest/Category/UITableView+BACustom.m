//
//  UITableView+BACustom.m
//  demoTest
//
//  Created by 博爱之家 on 16/3/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "UITableView+BACustom.h"

@implementation UITableView (BACustom)

- (void)updateWithBlock:(void (^)(UITableView *))block
{
    [self beginUpdates];
    block(self);
    [self endUpdates];
}

- (void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

- (void)insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation
{
    NSIndexPath *toInsert = [NSIndexPath indexPathForRow:row inSection:section];
    [self insertRowAtIndexPath:toInsert withRowAnimation:animation];
}










@end
