//
//  BAPickerView.h
//  BADemoTest
//
//  Created by 博爱之家 on 16/3/20.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BAPickerViewDelegate <NSObject>

- (void)getSelectCity:(NSString *)city;

@end

@interface BAPickerView : UIView

@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *area;

@property (nonatomic, weak) id<BAPickerViewDelegate> delegate;

//+ (BAPickerView *)instanceDatePickerView;

- (void)showInView:(UIView *)view;
- (void)hiddenPickerView;

- (NSString *)protectString:(NSString *)string;

@end
