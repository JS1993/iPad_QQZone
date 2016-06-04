//
//  JSMoodViewController.m
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSMoodViewController.h"

@implementation JSMoodViewController

-(void)viewDidLoad{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(publish)];
    
    self.title=@"发表心情";
    
    self.view.backgroundColor=[UIColor whiteColor];
}

-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)publish{
    
    NSLog(@"发表心情");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
