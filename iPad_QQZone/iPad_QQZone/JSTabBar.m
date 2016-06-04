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
#import "JSTabBarBtn.h"

@interface JSTabBar()

@property(nonatomic,strong)JSTabBarBtn* selectedBtn;

@end

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
    
    JSTabBarBtn* btn=[JSTabBarBtn buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(tabBarBtnClicked:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    
}


-(void)didRotationToLandScape:(BOOL)isLandScape{
    
    NSInteger count=self.subviews.count;
    
    self.width=self.superview.width;
    
    self.height=kDockItemHeight*count;
    
    for (NSInteger i=0; i<count; i++) {
        
        JSTabBarBtn* btn=self.subviews[i];
        btn.height=kDockItemHeight;
        btn.width=self.width;
        btn.x=0;
        btn.y=i*kDockItemHeight;
        
        [btn didRotationToLandScape:isLandScape];
        
    }
}

-(void)tabBarBtnClicked:(JSTabBarBtn*)btn{
    
    if ([self.delegate respondsToSelector:@selector(tabBarBtnDidClicked:andClickBtn:)]) {
        [self.delegate tabBarBtnDidClicked:self andClickBtn:btn];
    }
    
    //保存按钮点击状态三部曲
    self.selectedBtn.selected=NO;
    
    self.selectedBtn=btn;
    
    self.selectedBtn.selected=YES;
    
}
@end
