//
//  RoundedRectView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "RoundedRectView.h"

@implementation RoundedRectView


- (void)drawRect:(CGRect)rect {
    // 根据bounds和cornerRadius创建贝塞尔绘制路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10.0];
    // 设置线宽
    [path setLineWidth:10];
    // 设置颜色
    [[UIColor blueColor] setFill];
    [[UIColor whiteColor] setStroke];
    // 填充和描边
    [path fill];
    [path stroke];
    
}


@end
