//
//  JSBottomMenu.h
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kBottomMenuItemTypeMood,
    kBottomMenuItemTypePhoto,
    kBottomMenuItemTypeBlog
} BottomMenuItemType;

@interface JSBottomMenu : UIView

-(void)didRotationToLandScape:(BOOL)isLandScape;

@end
