//
//  JSTabBarBtn.m
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSTabBarBtn.h"
#import "UIView+JSViewExtension.m"

@interface JSTabBarBtn()

@property(nonatomic,assign)BOOL islandScape;

@end

@implementation JSTabBarBtn


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode=UIViewContentModeCenter;
    }
    return self;
}

-(void)didRotationToLandScape:(BOOL)isLandScape{
    
    self.islandScape=isLandScape;
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.height=self.height;
    self.imageView.width=self.islandScape?self.width*0.4:self.width;
    self.imageView.x=0;
    self.imageView.y=0;
    
    self.titleLabel.width=self.islandScape?self.width*0.6:0;
    self.titleLabel.height=self.islandScape?self.height:0;
    self.titleLabel.x=self.islandScape?CGRectGetMaxX(self.imageView.frame):-1;
    self.titleLabel.y=self.islandScape?0:-1;
    
}

//拦截高亮状态
-(void)setHighlighted:(BOOL)highlighted{}

@end
