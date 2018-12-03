//
//  WhiteRoundView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/12/3.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "WhiteRoundView.h"

@implementation WhiteRoundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
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
    [[UIColor colorWithWhite:1.0 alpha:0.5] setFill];
    [path fill];
}


@end
