//
//  FillRectangleView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "FillRectangleView.h"

@implementation FillRectangleView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // 获取绘制矩形的大小
    CGRect bounds = self.bounds;
    // 通过矩形创建一个贝塞尔绘制路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:bounds];
    
    // 获取一个颜色，并设置为填充的颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor setFill];
    
    [path fill];
}


@end
