//
//  DemoVC7_replyView.h
//  demoTest
//
//  Created by 博爱 on 16/3/17.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^cilckIndexBlock)(NSInteger index, NSString *contentStr);
@interface DemoVC7_replyView : UIView

- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)imageName;
- (void)callBackIndex:(cilckIndexBlock)clickIndex;

@end
