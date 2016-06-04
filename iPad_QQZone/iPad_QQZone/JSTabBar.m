//
//  JSTabBar.m
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSTabBar.h"
#import "JSConst.h"
#import "UIView+JSViewExtension.m"

@implementation JSTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBtnWithtTitle:@"全部动态"  andImage:@"tab_bar_feed_icon"];
        [self setBtnWithtTitle:@"与我相关" andImage:@"tab_bar_passive_feed_icon"];
        [self setBtnWithtTitle:@"照片墙" andImage:@"tab_bar_pic_wall_icon"];
        [self setBtnWithtTitle:@"电子相框" andImage:@"tab_bar_e_album_icon"];
        [self setBtnWithtTitle:@"好友" andImage:@"tab_bar_friend_icon"];
        [self setBtnWithtTitle:@"更多" andImage:@"tab_bar_e_more_icon"];
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


-(void)didRotationToLandScape:(BOOL)isLandScape{
    
    NSInteger count=self.subviews.count;
    
    self.width=self.superview.width;
    
    self.height=kDockItemHeight*count;
    
    for (NSInteger i=0; i<count; i++) {
        
        UIButton* btn=self.subviews[i];
        btn.height=kDockItemHeight;
        btn.width=self.width;
        btn.x=0;
        btn.y=i*kDockItemHeight;
        
    }
}

-(void)tabBarBtnClicked:(UIButton*)btn{
    
    
}
@end
