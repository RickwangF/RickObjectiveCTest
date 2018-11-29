//
//  UIImage+Round.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "UIImage+Round.h"

@implementation UIImage (Round)

+(UIImage *)roundImage:(UIImage *)originalImage{
    // 设置图片的尺寸
    CGSize size = CGSizeMake(200, 200);
    // 创建一个bitmap的CGContext，并使之成为当前的CGContext
    UIGraphicsBeginImageContext(size);
    // 创建一个矩形
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    // 从矩形创建一个椭圆的贝塞尔绘制路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    // 为绘制路径添加一个剪切效果，圆形路径外的部分将被裁切
    [path addClip];
    // 使用原图在制定的矩形上进行绘制
    [originalImage drawInRect:rect];
    // 从当前的CGContext中获得已经绘制完成的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 从CGContext栈中将当前CGContext移除
    UIGraphicsEndImageContext();
    // 返回图片
    return image;
}

-(UIImage*)cornerRadiusImage{
    // 设置图片的尺寸
    CGSize size = CGSizeMake(200, 200);
    // 创建一个bitmap的CGContext，并使之成为当前的CGContext
    UIGraphicsBeginImageContext(size);
    // 创建一个矩形
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    // 从矩形创建一个圆角矩形的贝塞尔绘制路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:15];
    // 为绘制路径添加一个剪切效果，圆形路径外的部分将被裁切
    [path addClip];
    // 使用原图在制定的矩形上进行绘制
    [self drawInRect:rect];
    // 从当前的CGContext中获得已经绘制完成的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 从CGContext栈中将当前CGContext移除
    UIGraphicsEndImageContext();
    // 返回图片
    return image;
}

@end
