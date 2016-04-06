//
//  BACustomModalTransition.h
//  BAModel动画
//
//  Created by 博爱 on 16/3/10.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BACustomModalTransition : UIPercentDrivenInteractiveTransition<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate,UIGestureRecognizerDelegate>

//---设置是否可拖拽（默认：不可拖动）
@property (nonatomic, assign, getter=isDragable) BOOL dragable;
//---初始化 model视图控制器
- (id)initWithModalViewController:(UIViewController *)modalViewController;

@end
