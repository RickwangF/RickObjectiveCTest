//
//  TriangleRectView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2019/1/17.
//  Copyright © 2019 KMZJ. All rights reserved.
//

#import "TriangleRectView.h"

@implementation TriangleRectView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	CGRect bounds = self.bounds;
	CGFloat maxX = CGRectGetMaxX(bounds);
	CGFloat maxY = CGRectGetMaxY(bounds);
	CGFloat midY = CGRectGetMidY(bounds);
	[UIColor.lightGrayColor setFill];
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(17, 0, maxX - 17, maxY) cornerRadius:5];
	[rectPath fill];
	
	UIBezierPath *trianglePath = [UIBezierPath bezierPath];
	[trianglePath moveToPoint:CGPointMake(17, midY - 10)];
	[trianglePath addLineToPoint:CGPointMake(2, midY - 2)];
	[trianglePath addQuadCurveToPoint:CGPointMake(2, midY+2) controlPoint:CGPointMake(0, midY)];
	[trianglePath addLineToPoint:CGPointMake(17, midY+10)];
	[trianglePath closePath];
	[trianglePath fill];
}


@end
