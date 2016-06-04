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

-(void)tabBarBtnDidClicked:(JSTabBar*)tabBar fromIndex:(NSInteger)from toIndex:(NSInteger)to;

@end

@interface JSTabBar : UIView


-(void)didRotationToLandScape:(BOOL)isLandScape;

@property(nonatomic,strong)id<JSTarBarMenuDelegate> delegate;

// 让SelectItem变成不选中
- (void)unSelected;

@end
