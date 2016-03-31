//
//  YRDemandShareCell.h
//  yrapp
//
//  Created by 博爱 on 16/3/4.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^cilckIndexBlock)(NSInteger index);

@interface YRDemandShareCell : UITableViewCell

@property (strong, nonatomic) BAButton_image_text *collectionBtn;
@property (strong, nonatomic) BAButton_image_text *supportBtn;
@property (strong, nonatomic) BAButton_image_text *shareBtn;
@property (strong, nonatomic) BAButton_image_text *shangBtn;

- (void)callBackIndex:(cilckIndexBlock)clickIndex;


@end
