//
//  UIImage+CJTool.h
//  Antenna
//
//  Created by HHLY on 16/6/14.
//  Copyright © 2016年 HHLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HPWTool)

/** 裁剪图片为圆 */
+(instancetype)visitor_clipWithImageName:(NSString*)name bordersW:(CGFloat)bordersW borderColor:(UIColor *)borderColor;
/** 设置图片的背景颜色 */
+ (UIImage *)visitor_imageWithColor:(UIColor *)color;

@end
