//
//  BAHomeIncomeCell.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAHomeIncomeCell.h"

@implementation BAHomeIncomeCell

+ (instancetype)theBAHomeIncomeCellWithTableView:(UITableView *)tableView
{
    static NSString *cellId = @"BAHomeIncomeCell";
    BAHomeIncomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"BAHomeIncomeCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setDataModel:(YRHomeIncomeModelData *)dataModel
{
    _dataModel = dataModel;
    
    self.rankImageView.image = [UIImage imageNamed:dataModel.headImg];
    self.rankNameLabel.text = dataModel.nickName;
    self.rankIncomeLabel.text = dataModel.score;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
