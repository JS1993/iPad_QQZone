//
//  JSTabBar.h
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSTabBar;
@class JSTabBarBtn;

@protocol JSTarBarMenuDelegate <NSObject>

@optional

-(void)tabBarBtnDidClicked:(JSTabBar*)tabBar andClickBtn:(JSTabBarBtn*)btn;

@end

@interface JSTabBar : UIView


-(void)didRotationToLandScape:(BOOL)isLandScape;

@property(nonatomic,strong)id<JSTarBarMenuDelegate> delegate;

@end
