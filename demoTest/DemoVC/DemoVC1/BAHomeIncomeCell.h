//
//  BAHomeIncomeCell.h
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BAHomeIncomeModel.h"

@interface BAHomeIncomeCell : UITableViewCell

@property (weak, nonatomic  ) IBOutlet UIImageView   *rankImageView;
@property (weak, nonatomic  ) IBOutlet UILabel       *rankNameLabel;
@property (weak, nonatomic  ) IBOutlet UILabel       *rankIncomeLabel;

@property (nonatomic, strong) YRHomeIncomeModelData  *dataModel;

+ (instancetype)theBAHomeIncomeCellWithTableView:(UITableView *)tableView;

@end
