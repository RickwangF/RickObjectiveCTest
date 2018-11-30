//
//  RoundView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/30.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "RoundView.h"

@implementation RoundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    if (width != height) {
        if (width < height){
            height = width;
        }
        else{
            width = height;
        }
    }
    
    CGRect cgRect = CGRectMake(0, 0, width, height);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:cgRect];
    [UIColor.blueColor setFill];
    [path fill];
}


@end
