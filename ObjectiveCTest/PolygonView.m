//
//  PolygonView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/30.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "PolygonView.h"

@implementation PolygonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // 初始化一个贝塞尔绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 设置起点
    [path moveToPoint:CGPointMake(100, 0)];
    // 从起点到（300，0）添加一条直线
    [path addLineToPoint:CGPointMake(300, 0)];
    [path addLineToPoint:CGPointMake(400, 173.2)];
    [path addLineToPoint:CGPointMake(300, 346.4)];
    [path addLineToPoint:CGPointMake(100, 346.4)];
    [path addLineToPoint:CGPointMake(0, 173.2)];
    // 从（0，173.2）闭合整个绘制路径
    [path closePath];
    // 绘制路径填充颜色
    [UIColor.greenColor setFill];
    [path fill];
}


@end
