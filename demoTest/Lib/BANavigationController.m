//
//  BANavigationController.m
//  QJdouguoView
//
//  Created by Justin on 16/3/19.
//  Copyright © 2016年 Justin. All rights reserved.
//

#import "BANavigationController.h"
#import "UIBarButtonItem+Item.h"

@interface BANavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) id popDelegate;

@end

@implementation BANavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBarTintColor:BA_ColorFromRGB(0xffffff)];
    [self.navigationBar setTranslucent:NO];
    self.hidesBarsOnSwipe = YES;
    
    // 去掉导航分割线
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];

    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    // 实现滑动返回功能
    // 清空滑动返回手势代理
    self.interactivePopGestureRecognizer.delegate = nil;
    self.delegate = self;

    UINavigationBar * bar = self.navigationBar;
    
    [bar setBarTintColor:BA_Green_Color];
    
    // 设置导航条按钮的文字颜色
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = BA_ColorFromRGB(0xf7f7f7);
    titleAttr[NSFontAttributeName] = BA_FontSize(18);
    
    [bar setTitleTextAttributes:titleAttr];
}

// 导航控制器跳转完成的时候调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    BALog(@"%@", self.viewControllers[0]);
    if (viewController == self.viewControllers[0])
    {
        // 显示根控制器
        // 返回滑动返回手势代理
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }
    else
    {
        // 实现滑动返回功能
        // 清空滑动返回手势代理
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
    //    BALog(@"%s", __func__);
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    BALog(@"%s", __func__);
    
    // 设置非根控制器导航条内容
    if (self.viewControllers.count != 0)
    {
        // 设置导航条的内容
        // 设置导航条左边 右边
        // 左边
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_back"] highImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] target:self action:@selector(backToPre) forControlEvents:UIControlEventTouchUpInside];
        
        // 右边
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(backToRoot) forControlEvents:UIControlEventTouchUpInside];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backToPre
{
    
    [self popViewControllerAnimated:YES];
}

- (void)backToRoot
{
    
    [self popToRootViewControllerAnimated:YES];
}



@end
