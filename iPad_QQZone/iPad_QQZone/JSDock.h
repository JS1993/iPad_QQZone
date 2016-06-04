//
//  JSDock.h
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSBottomMenu.h"
#import "JSTabBar.h"
#import "JSIconBtn.h"

@interface JSDock : UIView

@property(nonatomic,strong)JSBottomMenu* bottomMenu;

@property(nonatomic,strong)JSTabBar* tabBar;

@property(nonatomic,strong)JSIconBtn* iconBtn;

-(void)didRotationToLandScape:(BOOL)isLandScape;

@end
