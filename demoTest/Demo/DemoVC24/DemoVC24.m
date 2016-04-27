//
//  DemoVC24.m
//  demoTest
//
//  Created by 博爱 on 16/4/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC24.h"
#import "DemoVC24_NSNotificationVC.h"

@interface DemoVC24 ()
{
//    BATextView *_textView2;
    UILabel *_label1;
    UILabel *_label2;
    UILabel *_label3;
}
@end

@implementation DemoVC24

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _label1 = [UILabel new];
    _label1.frame = CGRectMake(10, 20, BA_SCREEN_WIDTH - 20, 50);
    _label1.text = @"用户名：(待传值)";
    
    _label2 = [UILabel new];
    _label2.frame = CGRectMake(_label1.x, _label1.bottom + 10, _label1.width, 50);;
    _label2.text = @"密码：(待传值)";
    
    _label3 = [UILabel new];
    _label3.frame = CGRectMake(_label1.x, _label1.bottom + 10, _label1.width, 50);;
    _label3.text = @"密码：(待传值)";
    
    BACustomButton *btn = [BACustomButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(_label1.x, _label2.bottom + 20, _label2.width, 50);
    btn.backgroundColor = BA_Yellow_Color;
    [btn setTitle:@"下一页面(自定义转场动画！)" forState:UIControlStateNormal];
    [btn setTitleColor:BA_Red_Color];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    _label3 = [UILabel new];
    _label3.frame = CGRectMake(btn.x, btn.bottom + 10, btn.width, 50);;
    _label3.text = @"";
    
    [self.view addSubview:_label1];
    [self.view addSubview:_label2];
    [self.view addSubview:btn];
    [self.view addSubview:_label3];

    // 1.注册为观察者，监听B视图中的通知【共三步】
    [BA_Noti addObserver:self selector:@selector(AMethod:) name:@"MyNotificationName" object:nil];
    [BA_Noti addObserver:self selector:@selector(applicationDidBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (IBAction)clickBtn:(BACustomButton *)sender
{
    /*!
     
     在项目中没有创建 UINavgationController，无法使用默认的 push 方法 进行页面的跳转时。
     
     使用另一种页面跳转方法 ：
     
     */
    
    //   默认跳转方式，从底部推出
    //    UIViewController * viewController = [UIViewController alloc] init];
    //    [self presentViewController: viewController animated:YES completion:nil];
    
    
    //    根据需求设置跳转时的样式:
    CATransition *animation = [CATransition animation];
    //  时间
    animation.duration = 0.5;
    /**  type：动画类型
     *  pageCurl       向上翻一页
     *  pageUnCurl     向下翻一页
     *  rippleEffect   水滴
     *  suckEffect     收缩
     *  cube           方块
     *  oglFlip        上下翻转
     */
    animation.type = @"pageCurl";
    
    /**  type：页面转换类型
     *  kCATransitionFade       淡出
     *  kCATransitionMoveIn     覆盖
     *  kCATransitionReveal     底部显示
     *  kCATransitionPush       推出
     */
    animation.type = kCATransitionReveal;
    
    //PS：type 更多效果请 搜索： CATransition
    
    /**  subtype：出现的方向
     *  kCATransitionFromRight       右
     *  kCATransitionFromLeft        左
     *  kCATransitionFromTop         上
     *  kCATransitionFromBottom      下
     */
    animation.subtype = kCATransitionFromRight;
    
    
    
    DemoVC24_NSNotificationVC *vc = [DemoVC24_NSNotificationVC new];
    
    [self.view.window.layer addAnimation:animation forKey:nil];                   //  添加动作
    [self presentViewController: vc animated:YES completion:nil];
    
    
//    DemoVC24_NSNotificationVC *vc = [DemoVC24_NSNotificationVC new];
    
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)AMethod:(NSNotification *)notification
{
    // 2.获取通知携带的数据，更新label的文本信息
    NSDictionary *dictData = [notification userInfo];
    if (!dictData) return; // 此处处理有问题，需看实际情况！
    _label1.text = [NSString stringWithFormat:@"用户名：%@", dictData[@"name"]];
    _label2.text = [NSString stringWithFormat:@"密 码 ：%@", dictData[@"pwd"]];
}

- (void)applicationDidBecomeActiveNotification:(NSNotification *)notification
{
    _label3.backgroundColor = BA_Green_Color;
    _label3.text = @"返回到前台！";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // 放dealloc里面removeObserver也行，最新版本的放在didReceiveMemoryWarning！
    // 3.移除所有通知
    [BA_Noti removeObserver:self];
}

//- (void)dealloc
//{
//    // 3.移除所有通知【也可以在delloc中实现此方法】
//    [BA_Noti removeObserver:self];
//}

@end
