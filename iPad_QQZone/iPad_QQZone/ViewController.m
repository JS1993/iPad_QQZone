//
//  ViewController.m
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/3.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "JSDock.h"
#import "JSConst.h"
#import "UIView+JSViewExtension.h"
#import "JSBottomMenu.h"
#import "JSTabBar.h"
#import "JSIconBtn.h"
#import "JSMoodViewController.h"


@interface ViewController ()<JSTarBarMenuDelegate,JSBottomMenuDelegate>

@property(nonatomic,strong)JSDock* dock;

@end

@implementation ViewController


/*dock的懒加载*/
-(JSDock *)dock
{
    if (_dock==nil) {
        _dock=[[JSDock alloc]init];
        _dock.x=0;
        _dock.y=0;
        _dock.height=self.view.height;
        BOOL isLandScape=self.view.width==kLandscapeWidth;
        _dock.tabBar.delegate=self;
        _dock.bottomMenu.delegate=self;
        [_dock.iconBtn addTarget:self action:@selector(iconBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [_dock  didRotationToLandScape:isLandScape];
        
        [self.view addSubview:_dock];
    }
    return _dock;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dock];
}

#pragma mark-头像按钮的点击事件

-(void)iconBtnClicked{
    
}

#pragma mark-tabbBarDelegate

-(void)tabBarBtnDidClicked:(JSTabBar *)tabBar andClickBtn:(JSTabBarBtn *)btn{
    
}

#pragma mark-bottomMenuDelegate

-(void)bottomMenuBtnDidClicked:(JSBottomMenu *)bottoMenu andClickBtn:(UIButton *)btn{
    switch (btn.tag) {
        case kBottomMenuItemTypeMood:
        {
            JSMoodViewController* moodVC=[[JSMoodViewController alloc]init];
            UINavigationController* nav=[[UINavigationController alloc]initWithRootViewController:moodVC];
            
            nav.modalPresentationStyle=UIModalPresentationFormSheet;
            nav.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
            
            [self presentViewController:nav animated:YES completion:nil];
            
        }
            break;
        case kBottomMenuItemTypePhoto:
        {
            
        }
            break;
        case kBottomMenuItemTypeBlog:
        {
            
        }
            
            break;
        default:
            break;
    }
}

//监听屏幕尺寸改变
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
     BOOL isLandScape=size.width==kLandscapeWidth;
    
    [UIView animateWithDuration:[coordinator transitionDuration] animations:^{
        
        [self.dock didRotationToLandScape:isLandScape];
        
    }];
}

@end
