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


@interface ViewController ()

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
        _dock.autoresizingMask=UIViewAutoresizingFlexibleHeight;
        
        BOOL isLandScape=self.view.width==kLandscapeWidth;
        
        [_dock  didRotationToLandScape:isLandScape];
        
        _dock.backgroundColor=[UIColor redColor];
        
        [self.view addSubview:_dock];
    }
    return _dock;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dock];
}

//监听屏幕尺寸改变
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
     BOOL isLandScape=size.width==kLandscapeWidth;
    
    [UIView animateWithDuration:[coordinator transitionDuration] animations:^{
        
        [self.dock didRotationToLandScape:isLandScape];
        
    }];
}

@end
