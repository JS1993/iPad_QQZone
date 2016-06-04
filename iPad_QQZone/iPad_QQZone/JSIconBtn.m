//
//  JSIconBtn.m
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSIconBtn.h"
#import "JSConst.h"
#import "UIView+JSViewExtension.m"


@interface JSIconBtn()

@property(nonatomic,assign)BOOL islandScape;

@end

@implementation JSIconBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"placeHolder"] forState:UIControlStateNormal];
        [self setTitle:@"苏苏" forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}


-(void)didRotationToLandScape:(BOOL)isLandScape{
    // 设置自身的Frame
    self.width = isLandScape ? kIconButtonLandscapeWidth : kIconButtonPortraitWH;
    self.height = isLandScape ? kIconButtonLandscapeHeight : kIconButtonPortraitWH;
    self.x = (self.superview.width - self.width) * 0.5;
    self.y = kIconButtonY;
    
    self.islandScape=isLandScape;
    
    [self setNeedsLayout];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.height=self.islandScape?self.width:self.height;
    
    self.imageView.width=self.width;
    
    self.imageView.x=0;
    self.imageView.y=0;
    
    self.titleLabel.height=self.islandScape?(self.height-self.width):0;
    self.titleLabel.width=self.islandScape?self.width:0;
    self.titleLabel.x=self.islandScape?0:-1;
    self.titleLabel.y=self.islandScape?CGRectGetMaxY(self.imageView.frame):-1;
}
@end
