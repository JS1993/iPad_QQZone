//
//  JSDock.m
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSDock.h"
#import "UIView+JSViewExtension.h"
#import "JSConst.h"
#import "JSBottomMenu.h"
#import "JSTabBar.h"

@interface JSDock()

@property(nonatomic,strong)JSBottomMenu* bottomMenu;

@property(nonatomic,strong)JSTabBar* tabBar;

@end

@implementation JSDock


/*tabBar懒加载*/
-(JSTabBar *)tabBar
{
    if (_tabBar==nil) {
        _tabBar=[[JSTabBar alloc]init];
        [self addSubview:_tabBar];
    }
    return _tabBar;
}


/*底部菜单懒加载*/
-(JSBottomMenu *)bottomMenu
{
    if (_bottomMenu==nil) {
        _bottomMenu=[[JSBottomMenu alloc]init];
        [self addSubview:_bottomMenu];
    }
    return _bottomMenu;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


-(void)didRotationToLandScape:(BOOL)isLandScape{
    
    self.width=isLandScape?kDockLandscapeWidth:kDockPortraitWidth;
    
    [self.bottomMenu didRotationToLandScape:isLandScape];
    
    [self.tabBar didRotationToLandScape:isLandScape];
    
    CGFloat screenHeight=isLandScape?kLandscapeHeight:kLandscapeWidth;
    
    self.tabBar.y = screenHeight - self.tabBar.height-self.bottomMenu.height;
    
    NSLog(@"%f %f %f",screenHeight,self.tabBar.height,self.bottomMenu.height);
    
}

@end
