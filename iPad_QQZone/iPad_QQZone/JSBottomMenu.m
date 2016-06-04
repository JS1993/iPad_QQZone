//
//  JSBottomMenu.m
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSBottomMenu.h"
#import "JSConst.h"
#import "UIView+JSViewExtension.h"

@implementation JSBottomMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBtnWithTyepe:kBottomMenuItemTypeMood andImage:@"tabbar_mood"];
        
        [self setBtnWithTyepe:kBottomMenuItemTypePhoto andImage:@"tabbar_photo"];
        
        [self setBtnWithTyepe:kBottomMenuItemTypeBlog andImage:@"tabbar_blog"];
        
    }
    return self;
}

-(void)setBtnWithTyepe:(BottomMenuItemType)type andImage:(NSString*)image{
    
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    
    btn.tag=type;
    
    [btn addTarget:self action:@selector(bottomBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self addSubview:btn];
    
}

-(void)didRotationToLandScape:(BOOL)isLandScape{
    
    NSInteger count=self.subviews.count;
    
    self.width=self.superview.width;
    
    self.height=isLandScape?kDockItemHeight:kDockItemHeight*count;
    
    CGFloat screenHeight=isLandScape?kLandscapeHeight:kLandscapeWidth;
    
    self.y = screenHeight - self.height;
    
    for (NSInteger i=0; i<count; i++) {
        UIButton* btn=self.subviews[i];
        
        
        if (isLandScape) {//如果横屏
            
            btn.width=self.width/count;
            btn.height=kDockItemHeight;
            btn.x=i*btn.width;
            btn.y=0;
           
        }else{//如果竖屏
            
            btn.width=self.width;
            btn.height=kDockItemHeight;
            btn.x=0;
            btn.y=i*kDockItemHeight;
            
        }
    }
    
    
}

-(void)bottomBtnClicked:(UIButton*)btn{
    
    if ([self.delegate respondsToSelector:@selector(bottomMenuBtnDidClicked:andClickBtn:)]) {
        [self.delegate bottomMenuBtnDidClicked:self andClickBtn:btn];
    }
    
}

@end
