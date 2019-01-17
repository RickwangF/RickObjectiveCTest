//
//  ArrowView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2019/1/17.
//  Copyright © 2019 KMZJ. All rights reserved.
//

#import "ArrowView.h"

@implementation ArrowView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
	[path setLineWidth:1.0];
	[UIColor.blueColor setFill];
	CGRect bounds = self.bounds;
	CGFloat maxX = CGRectGetMaxX(bounds);
	CGFloat maxY = CGRectGetMaxY(bounds);
	CGFloat midY = CGRectGetMidY(bounds);
	
	[path moveToPoint:CGPointMake(0, midY)];
	[path addLineToPoint:CGPointMake(17, midY - 10)];
	[path addLineToPoint:CGPointMake(17, 5)];
	[path addQuadCurveToPoint:CGPointMake(22, 0) controlPoint:CGPointMake(17, 0)];
	[path addLineToPoint:CGPointMake(maxX-5, 0)];
	[path addQuadCurveToPoint:CGPointMake(maxX, 5) controlPoint:CGPointMake(maxX, 0)];
	[path addLineToPoint:CGPointMake(maxX, maxY-5)];
	[path addQuadCurveToPoint:CGPointMake(maxX-5, maxY) controlPoint:CGPointMake(maxX, maxY)];
	[path addLineToPoint:CGPointMake(22, maxY)];
	[path addQuadCurveToPoint:CGPointMake(17, maxY-5) controlPoint:CGPointMake(17, maxY)];
	[path addLineToPoint:CGPointMake(17, midY+10)];
	[path closePath];
	
	[path fill];
}



@end
