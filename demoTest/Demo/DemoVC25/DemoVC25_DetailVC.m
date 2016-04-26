//
//  DemoVC25_DetailVC.m
//  demoTest
//
//  Created by 博爱 on 16/4/25.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC25_DetailVC.h"

@interface DemoVC25_DetailVC ()
{
    CGRect     playerFrame;
}

@property (nonatomic, strong) WMPlayer  *wmPlayer;

@end

@implementation DemoVC25_DetailVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 注册播放完成通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fullScreenBtnClick:) name:WMPlayerFullScreenButtonClickedNotification object:nil];
        
    }
    return self;
}
-(BOOL)prefersStatusBarHidden{
    if (_wmPlayer) {
        if (_wmPlayer.isFullscreen) {
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
}

- (WMPlayer *)wmPlayer
{
    if (!_wmPlayer)
    {
        playerFrame = CGRectMake(0, 0, BA_SCREEN_WIDTH, (BA_SCREEN_WIDTH)*3/4);
        _wmPlayer = [[WMPlayer alloc]initWithFrame:playerFrame videoURLStr:self.URLString];
        _wmPlayer.closeBtn.hidden = YES;
        [self.view addSubview:_wmPlayer];
        [_wmPlayer play];
    }
    return _wmPlayer;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //旋转屏幕通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onDeviceOrientationChange)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil
     ];
}
-(void)toFullScreenWithInterfaceOrientation:(UIInterfaceOrientation )interfaceOrientation{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    [_wmPlayer removeFromSuperview];
    _wmPlayer.transform = CGAffineTransformIdentity;
    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft) {
        _wmPlayer.transform = CGAffineTransformMakeRotation(-M_PI_2);
    }else if(interfaceOrientation==UIInterfaceOrientationLandscapeRight){
        _wmPlayer.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    _wmPlayer.frame = CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT);
    _wmPlayer.playerLayer.frame =  CGRectMake(0,0, BA_SCREEN_HEIGHT,BA_SCREEN_WIDTH);
    
    [_wmPlayer.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(BA_SCREEN_WIDTH-40);
        make.width.mas_equalTo(BA_SCREEN_HEIGHT);
    }];
    
    [_wmPlayer.closeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_wmPlayer).with.offset((-BA_SCREEN_HEIGHT/2));
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(30);
        make.top.equalTo(_wmPlayer).with.offset(5);
        
    }];
    [[UIApplication sharedApplication].keyWindow addSubview:_wmPlayer];
    _wmPlayer.fullScreenBtn.selected = YES;
    [_wmPlayer bringSubviewToFront:_wmPlayer.bottomView];
    
}
-(void)toNormal{
    [_wmPlayer removeFromSuperview];
    [UIView animateWithDuration:0.5f animations:^{
        _wmPlayer.transform = CGAffineTransformIdentity;
        _wmPlayer.frame =CGRectMake(playerFrame.origin.x, playerFrame.origin.y, playerFrame.size.width, playerFrame.size.height);
        _wmPlayer.playerLayer.frame =  _wmPlayer.bounds;
        [self.view addSubview:_wmPlayer];
        [_wmPlayer.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_wmPlayer).with.offset(0);
            make.right.equalTo(_wmPlayer).with.offset(0);
            make.height.mas_equalTo(40);
            make.bottom.equalTo(_wmPlayer).with.offset(0);
        }];
        [_wmPlayer.closeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_wmPlayer).with.offset(5);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(30);
            make.top.equalTo(_wmPlayer).with.offset(5);
        }];
        
    }completion:^(BOOL finished) {
        _wmPlayer.isFullscreen = NO;
        [self setNeedsStatusBarAppearanceUpdate];
        _wmPlayer.fullScreenBtn.selected = NO;
        
    }];
}
-(void)fullScreenBtnClick:(NSNotification *)notice{
    UIButton *fullScreenBtn = (UIButton *)[notice object];
    if (fullScreenBtn.isSelected) {//全屏显示
        _wmPlayer.isFullscreen = YES;
        [self setNeedsStatusBarAppearanceUpdate];
        [self toFullScreenWithInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
    }else{
        [self toNormal];
    }
}
/**
 *  旋转屏幕通知
 */
- (void)onDeviceOrientationChange{
    if (_wmPlayer==nil||_wmPlayer.superview==nil){
        return;
    }
    
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    UIInterfaceOrientation interfaceOrientation = (UIInterfaceOrientation)orientation;
    switch (interfaceOrientation) {
        case UIInterfaceOrientationPortraitUpsideDown:{
            NSLog(@"第3个旋转方向---电池栏在下");
        }
            break;
        case UIInterfaceOrientationPortrait:{
            NSLog(@"第0个旋转方向---电池栏在上");
            if (_wmPlayer.isFullscreen) {
                [self toNormal];
            }
        }
            break;
        case UIInterfaceOrientationLandscapeLeft:{
            NSLog(@"第2个旋转方向---电池栏在左");
            if (_wmPlayer.isFullscreen == NO) {
                _wmPlayer.isFullscreen = YES;
                [self setNeedsStatusBarAppearanceUpdate];
                
                [self toFullScreenWithInterfaceOrientation:interfaceOrientation];
            }
        }
            break;
        case UIInterfaceOrientationLandscapeRight:{
            NSLog(@"第1个旋转方向---电池栏在右");
            if (_wmPlayer.isFullscreen == NO) {
                _wmPlayer.isFullscreen = YES;
                [self setNeedsStatusBarAppearanceUpdate];
                
                [self toFullScreenWithInterfaceOrientation:interfaceOrientation];
            }
        }
            break;
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.wmPlayer.hidden = NO;
}

-(void)releaseWMPlayer{
    [_wmPlayer.player.currentItem cancelPendingSeeks];
    [_wmPlayer.player.currentItem.asset cancelLoading];
    
    [_wmPlayer.player pause];
    [_wmPlayer removeFromSuperview];
    [_wmPlayer.playerLayer removeFromSuperlayer];
    [_wmPlayer.player replaceCurrentItemWithPlayerItem:nil];
    _wmPlayer = nil;
    _wmPlayer.player = nil;
    _wmPlayer.currentItem = nil;
    
    _wmPlayer.playOrPauseBtn = nil;
    _wmPlayer.playerLayer = nil;
}

- (void)dealloc
{
    [self releaseWMPlayer];
    [BA_Noti removeObserver:self];
    BALog(@"player 释放了");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
