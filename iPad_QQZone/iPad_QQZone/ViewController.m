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
#import "AllStatusViewController.h"


@interface ViewController ()<JSTarBarMenuDelegate,JSBottomMenuDelegate>

@property(nonatomic,strong)JSDock* dock;

@property(nonatomic,strong)UIView* contentView;

@property(nonatomic,assign)NSInteger currentIndex;

@end

@implementation ViewController


/*辅助容器视图懒加载*/
-(UIView *)contentView
{
    if (_contentView==nil) {
        _contentView=[[UIView alloc]init];
        _contentView.width = kContentViewWidth;
        _contentView.height = self.view.height - 20;
        _contentView.x = self.dock.width;
        _contentView.y = 20;
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_contentView];
    }
    return _contentView;
}


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
    
    AllStatusViewController *vc1 = [[AllStatusViewController alloc] init];
    [self packNav:vc1];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor blackColor];
    vc2.title=@"与我相关";
    [self packNav:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor purpleColor];
    vc3.title=@"照片墙";
    [self packNav:vc3];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor orangeColor];
    vc4.title=@"电子相框";
    [self packNav:vc4];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.view.backgroundColor = [UIColor yellowColor];
    vc5.title=@"好友";
    [self packNav:vc5];
    
    UIViewController *vc6 = [[UIViewController alloc] init];
    vc6.view.backgroundColor = [UIColor greenColor];
    vc6.title=@"更多";
    [self packNav:vc6];
    
    UIViewController *vc7 = [[UIViewController alloc] init];
    vc7.title = @"个人中心";
    vc7.view.backgroundColor = [UIColor lightGrayColor];
    [self packNav:vc7];
}

/**
 *  抽出一个包装导航控制器的方法,并且将他加入到我们的ChildViewControllers里面
 */
- (void)packNav:(UIViewController *)vc
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

#pragma mark-tabbBarDelegate

-(void)tabBarBtnDidClicked:(JSTabBar *)tabBar fromIndex:(NSInteger)from toIndex:(NSInteger)to{
    
    UIViewController* oldVC=self.childViewControllers[from];
    [oldVC.view removeFromSuperview];
    
    UIViewController* newVC=self.childViewControllers[to];
    newVC.view.frame=self.contentView.bounds;
    [self.contentView addSubview:newVC.view];
    
    self.currentIndex=to;
}

#pragma mark-头像按钮的点击事件

-(void)iconBtnClicked{
    
    [self tabBarBtnDidClicked:nil fromIndex:self.currentIndex toIndex:self.childViewControllers.count-1];
    
    [self.dock.tabBar unSelected];
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
        
         self.contentView.x = self.dock.width;
        
    }];
}

@end
