//
//  YRDemandUserViewCell.h
//  yrapp
//
//  Created by 博爱 on 16/3/4.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRDemandModel.h"

@interface YRDemandUserViewCell : UITableViewCell

@property (nonatomic, strong) YRDemandModelAuthor *demandDataModel;

@property (strong, nonatomic) UIImageView *userImageView;
@property (strong, nonatomic) UILabel *userNameLabel;
@property (strong, nonatomic) UILabel *userInfoLabel;
@property (strong, nonatomic) UIButton *attentionButton;

@end
