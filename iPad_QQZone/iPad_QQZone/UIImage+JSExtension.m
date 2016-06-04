//
//  UIImage+JSExtension.m
//  iPad_QQZone
//
//  Created by  江苏 on 16/6/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "UIImage+JSExtension.h"

@implementation UIImage (JSExtension)

/**
 *  传入图片名称,返回拉伸好的图片
 */
+ (UIImage *)resizeImage:(NSString *)imageName
{
    return [[UIImage imageNamed:imageName] resizeImage];
}

- (UIImage *)resizeImage
{
    CGFloat width = self.size.width * 0.5;
    CGFloat height = self.size.height * 0.5;
    return [self stretchableImageWithLeftCapWidth:width topCapHeight:height];
}

@end
