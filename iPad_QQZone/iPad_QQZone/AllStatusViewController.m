//
//  AllStatusViewController.m
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "AllStatusViewController.h"

@implementation AllStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 2.设置titleView
    NSArray *items = @[@"全部", @"特别关心", @"好友动态", @"认证空间"];
    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:items];
    sc.selectedSegmentIndex = 0;
    sc.tintColor = [UIColor lightGrayColor];
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    [sc setTitleTextAttributes:attributes forState:UIControlStateNormal];
    self.navigationItem.titleView = sc;
    
    // 3.监听UISegmentedControl的点击
    [sc addTarget:self action:@selector(scClick:) forControlEvents:UIControlEventValueChanged];
}

- (void)scClick:(UISegmentedControl *)sc
{
    NSLog(@"%ld", sc.selectedSegmentIndex);
}

@end
