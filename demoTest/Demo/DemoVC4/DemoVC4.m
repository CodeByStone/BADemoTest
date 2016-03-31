//
//  DemoVC4.m
//  demoTest
//
//  Created by 博爱 on 16/3/16.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC4.h"

@interface DemoVC4 ()

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation DemoVC4

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.title = @"Feed List Demo";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    self.images = @[].mutableCopy;
    
    [self addCell:@"Twitter" class:@"T1HomeTimelineItemsViewController" image:@"icon0.jpg"];
    [self addCell:@"Weibo" class:@"WBStatusTimelineViewController" image:@"icon1.jpg"];
    
    [self.tableView reloadData];
}


- (void)addCell:(NSString *)title class:(NSString *)className image:(NSString *)imageName {
    [self.titles addObject:title];
    [self.classNames addObject:className];
    [self.images addObject:[UIImage imageNamed:imageName]];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _titles[indexPath.row];
    cell.imageView.image = _images[indexPath.row];
    cell.imageView.clipsToBounds = YES;
    cell.imageView.layer.cornerRadius = 48 / 2;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 48;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *className = self.classNames[indexPath.row];
//    Class class = NSClassFromString(className);
//    if (class) {
//        UIViewController *ctrl = class.new;
//        ctrl.title = _titles[indexPath.row];
//        self.title = @" ";
//        [self.navigationController pushViewController:ctrl animated:YES];
//    }
    
    NSLog(@"你点击了第 %ld 行！", (long)indexPath.row);
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
