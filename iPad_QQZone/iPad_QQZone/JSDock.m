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

@interface JSDock()

@property(nonatomic,strong)JSBottomMenu* bottomMenu;

@end

@implementation JSDock


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
    
}

@end
