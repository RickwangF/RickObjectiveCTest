//
//  StrokeRectangleView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "StrokeRectangleView.h"

@implementation StrokeRectangleView

- (void)drawRect:(CGRect)rect {
    // 根据bounds获取贝塞尔绘制路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    // 设置画线的宽度为3.0pt
    [path setLineWidth:3.0];
    // 设置线条终点的样式：圆形
    [path setLineCapStyle:kCGLineCapRound];
    // 设置线条拐角的样式：圆形
    [path setLineJoinStyle:kCGLineJoinRound];
    
    // 设置线条的颜色
    UIColor *strokeColor = [UIColor greenColor];
    [strokeColor setStroke];
    
    // 划线
    [path stroke];
}

@end
