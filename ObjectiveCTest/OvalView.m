//
//  OvalView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "OvalView.h"

@implementation OvalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 通过bounds创建一个椭圆的贝塞尔绘制路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    // 同时设置填充和描边颜色
    [[UIColor redColor] set];
    // 填充
    [path fill];
}


@end
