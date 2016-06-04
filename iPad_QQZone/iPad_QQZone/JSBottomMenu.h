//
//  JSBottomMenu.h
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSBottomMenu;

typedef enum {
    kBottomMenuItemTypeMood,
    kBottomMenuItemTypePhoto,
    kBottomMenuItemTypeBlog
} BottomMenuItemType;

@protocol JSBottomMenuDelegate <NSObject>

@optional

-(void)bottomMenuBtnDidClicked:(JSBottomMenu*)bottoMenu andClickBtn:(UIButton*)btn;

@end

@interface JSBottomMenu : UIView

-(void)didRotationToLandScape:(BOOL)isLandScape;

@property(nonatomic,strong)id<JSBottomMenuDelegate> delegate;

@end
