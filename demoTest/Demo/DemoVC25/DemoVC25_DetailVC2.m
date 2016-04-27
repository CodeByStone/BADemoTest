//
//  DemoVC25_DetailVC2.m
//  yrapp
//
//  Created by 博爱 on 16/4/26.
//  Copyright © 2016年 有人科技. All rights reserved.
//

#import "DemoVC25_DetailVC2.h"
#import "BAVideoPlayer.h"


@interface DemoVC25_DetailVC2 ()<BAVideoPlayerDelegate>
{
    CGRect playerFrame;
}
@property (nonatomic, strong) BAVideoPlayer *player;

@end

@implementation DemoVC25_DetailVC2

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    self.player.hidden = NO;
    [self createUI];

}

- (void)dealloc
{
    //关闭播放器并销毁当前播放view
    //一定要在退出时使用,否则内存可能释放不了
    [_player close];
    [BA_Noti removeObserver:self];
    BALog(@"player 释放了");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    //    self.view.backgroundColor=[UIColor lightTextColor];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appwillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (BOOL)shouldAutorotate
{
    return !_player.isSwitch;
}

#pragma mark - BAVideoPlayerDelegate
//非全屏下返回点击(仅限默认UI)
- (void)backBtnClick
{
    [self backClick];
}

#pragma mark - 点击事件
// 返回
- (void)backClick
{
    if (_player)
    {
        [_player close];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    //UIStatusBarStyleDefault = 0 黑色文字，浅色背景时使用
    //UIStatusBarStyleLightContent = 1 白色文字，深色背景时使用
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return YES; // 返回NO表示要显示，返回YES将hiden
}

#pragma mark - ***** 通知
- (void)appwillResignActive:(NSNotification *)note
{
    if (_player)
    {
        [_player pause];
    }
    BALog(@"appwillResignActive");
}

- (void)appDidEnterBackground:(NSNotification*)note
{
    if (_player)
    {
        [_player pause];
    }
    BALog(@"appDidEnterBackground");
}

- (void)appWillEnterForeground:(NSNotification*)note
{
    if (_player)
    {
        [_player pause];
    }
    BALog(@"appWillEnterForeground");
}

- (void)appBecomeActive:(NSNotification *)note
{
    if (_player)
    {
        [_player play];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - 创建UI
- (void)createUI
{
    playerFrame = CGRectMake(0, 0, BA_SCREEN_WIDTH, (BA_SCREEN_HEIGHT)*3/4);
    
    // 播放器
    _player = [[BAVideoPlayer alloc] initWithFrame:playerFrame
                                               url:self.URLString
                                          delegate:self
                                    haveOriginalUI:YES];
    [self.view addSubview:_player];
    
    // 开始播放
    [_player play];

    [self.view bringSubviewToFront:_player];

    UIView *view2 = [UIView new];
    view2.frame = CGRectMake(0, CGRectGetMaxY(_player.frame) + 5, BA_SCREEN_WIDTH, 50);
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    
    UIView *view3 = [UIView new];
    view3.frame = CGRectMake(0, CGRectGetMaxY(view2.frame) + 5, BA_SCREEN_WIDTH, 100);
    view3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view3];
}

@end
