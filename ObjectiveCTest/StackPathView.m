//
//  StackPathView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/12/24.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "StackPathView.h"

@implementation StackPathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:rect];
	[UIColor.blueColor setFill];
	[rectPath fill];
	
	UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:rect];
	[UIColor.redColor setFill];
	[rectPath appendPath:ovalPath];
	[ovalPath fill];
	//[ovalPath fill];
}


@end
