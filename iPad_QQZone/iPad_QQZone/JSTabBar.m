//
//  JSTabBar.m
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSTabBar.h"

@implementation JSTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBtnWithtTitle:@"tab_bar_feed_icon"  andImage:@"全部动态"];
        [self setBtnWithtTitle:@"" andImage:@""];
        [self setBtnWithtTitle:@"" andImage:@""];
        [self setBtnWithtTitle:@"" andImage:@""];
        [self setBtnWithtTitle:@"" andImage:@""];
    }
    return self;
}

-(void)setBtnWithtTitle:(NSString*)title andImage:(NSString*)image{
    
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(tabBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self addSubview:btn];
    
}

-(void)tabBarBtnClicked:(UIButton*)btn{
    
}
@end
