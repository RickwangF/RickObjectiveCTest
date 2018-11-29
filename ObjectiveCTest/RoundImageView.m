//
//  RoundImageView.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "RoundImageView.h"

@implementation RoundImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGFloat height = rect.size.height;
    CGFloat width = rect.size.width;
    
    if (width != height) {
        if (width > height) {
            width = height;
        }
        else{
            height = width;
        }
    }
    
    if (self.image == nil) {
        return;
    }
}


@end
