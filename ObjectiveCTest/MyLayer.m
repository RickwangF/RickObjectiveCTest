//
//  MyLayer.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "MyLayer.h"

@implementation MyLayer

- (void)drawInContext:(CGContextRef)ctx{
    
    CGRect rect = self.bounds;
    CGFloat height = rect.size.height;
    CGFloat width = rect.size.width;
    
    // 设置图层的填充颜色为绿色
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    // 设置绘制路径的起点
    CGContextMoveToPoint(ctx, 0, 0);
    // 从起点添加一条直线到（width，0）
    CGContextAddLineToPoint(ctx, width, 0);
    // 从（width，0）添加一条直线到（width，height）
    CGContextAddLineToPoint(ctx, width, height);
    // 从（width,height）添加一条直线到（0，height）
    CGContextAddLineToPoint(ctx, 0, width);
    // 闭合这个绘制路径到起点
    CGContextClosePath(ctx);
    // 填充绘制路径
    CGContextFillPath(ctx);
}

@end
