//
//  UIImage+CJTool.m
//  Antenna
//
//  Created by HHLY on 16/6/14.
//  Copyright © 2016年 HHLY. All rights reserved.
//

#import "UIImage+HPWTool.h"

@implementation UIImage (HPWTool)

//设置图片的背景颜色
+ (UIImage *)visitor_imageWithColor:(UIColor *)color
{
    CGFloat imageW = 100;
    CGFloat imageH = 100;
    // 1.开启基于位图的图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0.0);
    
    // 2.画一个color颜色的矩形框
    [color set];
    UIRectFill(CGRectMake(0, 0, imageW, imageH));
    
    // 3.拿到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 裁剪图片为圆
+(instancetype)visitor_clipWithImageName:(NSString *)name bordersW:(CGFloat)bordersW borderColor:(UIColor *)borderColor
{
    UIImage *oldImage=[UIImage imageNamed:name];
    CGFloat borberW=bordersW;
    CGFloat imageW=oldImage.size.width+borberW*2;
    CGFloat imageH=oldImage.size.height+borberW*2;
    CGSize  imageSize=CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    CGContextRef ref=UIGraphicsGetCurrentContext();
    //画一个大圆
    [borderColor set];
    CGFloat bigRadius=imageW*0.5;
    CGFloat bigX=imageW*0.5;
    CGFloat bigY=imageH*0.5;
    CGContextAddArc(ref, bigX, bigY, bigRadius, 0, M_PI*2, 0);
    //渲染到图层
    CGContextFillPath(ref);
    
    //画一个小圆
    CGFloat smallRadius=bigRadius-borberW;
    CGContextAddArc(ref, bigX, bigY, smallRadius, 0, M_PI*2, 0);
    //裁剪
    CGContextClip(ref);
    //画图
    [oldImage drawInRect:CGRectMake(borberW, borberW, oldImage.size.width, oldImage.size.height)];
    //去除图片
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
}

@end
