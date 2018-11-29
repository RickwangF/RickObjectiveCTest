//
//  FullArcView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "FullArcView.h"

@implementation FullArcView

- (void)drawRect:(CGRect)rect {
    
    CGPoint center = CGPointMake(-10, -10);
    // center是弧线的原点，radius是弧线的角度，startAngle是开始画的角度，endAngle是结束的角度，clockwise是
    // 按顺时针方向绘制
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:100 startAngle:0 endAngle:100 clockwise:YES];
    [path setLineWidth:10];
    [[UIColor greenColor] set];
    
    [path stroke];
}


@end
