//
//  YRDemandShareCell.h
//  yrapp
//
//  Created by 博爱 on 16/3/4.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BACustomButton.h"

typedef void(^cilckIndexBlock)(NSInteger index);

@interface YRDemandShareCell : UITableViewCell

@property (strong, nonatomic) BACustomButton *collectionBtn;
@property (strong, nonatomic) BACustomButton *supportBtn;
@property (strong, nonatomic) BACustomButton *shareBtn;
@property (strong, nonatomic) BACustomButton *shangBtn;

- (void)callBackIndex:(cilckIndexBlock)clickIndex;


@end
