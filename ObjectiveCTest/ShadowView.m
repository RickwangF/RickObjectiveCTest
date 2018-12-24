//
//  ShadowView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/12/13.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ShadowView.h"

@implementation ShadowView

- (instancetype)initWithFrame:(CGRect)frame{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = UIColor.yellowColor;
		self.layer.cornerRadius = frame.size.width / 2;
		self.layer.shadowColor = UIColor.lightGrayColor.CGColor;
		self.layer.shadowOpacity = 0.8;
		self.layer.shadowRadius = 10;
	}
	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
