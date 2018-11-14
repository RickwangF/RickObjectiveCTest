//
//  RightImageButton.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/13.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "LeftImageButton.h"
#import <Masonry/Masonry.h>

/*
 图片在左边的按钮
 */

@implementation LeftImageButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    CGFloat height = frame.size.height;
    CGFloat width = frame.size.width;
    // 假设width > height
    self.imageView.frame = CGRectMake(0, 0, height, height);
    self.titleLabel.frame = CGRectMake(height, 0, width-height, height);
    return self;
}

-(UIEdgeInsets)alignmentRectInsets{
    return UIEdgeInsetsMake(0, 8, 0, -8);
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    if ((point.x >= -15.0 || point.x <= width) && (point.y >=0 || point.y <= height)) {
        NSLog(@"pint is (%f,%f)", point.x, point.y);
        return YES;
    }
    return NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
