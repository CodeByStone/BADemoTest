//
//  DemoVC12.m
//  demoTest
//
//  Created by 博爱 on 16/3/29.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC12.h"

#import "UIViewController+BAAlertView.h"

@interface DemoVC12 ()

#define KCancel @"取消"
#define KSure   @"确定"


- (IBAction)ios7Alert:(UIButton *)sender;
- (IBAction)ios7Actionsheet:(UIButton *)sender;
- (IBAction)ios8Alert:(UIButton *)sender;
- (IBAction)ios8ActionSheet:(UIButton *)sender;

@end

@implementation DemoVC12

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ios7Alert:(UIButton *)sender
{
    /** 下面是带输入框的alert，自适应系统 */
    [self BAAlertWithTitle:@"测试ios7Alert" message:@"ios7Alert message" buttons:@[KCancel, KSure]  textFieldNumber:2 configuration:^(UITextField *field, NSInteger index) {
        if (index == 0)
        {
            field.secureTextEntry = NO;
            field.placeholder = @"请输入账号：";
        }
        if (index == 1)
        {
            field.secureTextEntry = YES;
            field.placeholder = @"请输入密码：";
        }
        
    } animated:YES action:^(NSArray<UITextField *> *fields, NSInteger index) {
        NSLog(@"账号：%@, 密码：%@", fields[0].text, fields[1].text);
    }]; 
}

- (IBAction)ios7Actionsheet:(UIButton *)sender
{
    /** ios7 action sheet */
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"测试ios7Actionsheet" delegate:self cancelButtonTitle:KCancel destructiveButtonTitle:KSure otherButtonTitles:@"1",@"2", nil];
    [sheet showInView:self.view];
}

- (IBAction)ios8Alert:(UIButton *)sender
{
    /** 自适应 */
    [self BAAlertWithTitle:@"测试ios8Alert" message:@"ios8Alert message" andOthers:@[KCancel, KSure] animated:YES action:^(NSInteger index) {
        NSLog(@"click %ld",(long)index);
    }];
}

- (IBAction)ios8ActionSheet:(UIButton *)sender
{
    /** 自适应 */
    [self BAActionSheetWithTitle:@"测试ios8Actionsheet" message:@"ios8Actionsheet message" destructive:KSure destructiveAction:^(NSInteger index) {
        NSLog(@"click destructive");
    } andOthers:@[KCancel,@"1",@"2"] animated:YES action:^(NSInteger index) {
        NSLog(@"click %ld",(long)index);
    }];
}


@end
