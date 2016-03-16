//
//  DemoVC1.m
//  demoTest
//
//  Created by 博爱 on 16/3/15.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC1.h"
#import "BAHeader.h"
#import "YRHomeIncomeView.h"

@interface DemoVC1 ()

@end

@implementation DemoVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self setupSubView];
    
}

- (void)setupSubView
{
    YRHomeIncomeView *subView = [[YRHomeIncomeView alloc] initWithFrame:CGRectMake(10, 100, KSCREEN_WIDTH - 20, 145)];
    
    [self.view addSubview:subView];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
