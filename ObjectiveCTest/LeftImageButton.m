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

/*
 对齐矩形相对于Frame水平向右移动了8个pt，Frame相对于对齐矩形向左移动了8个pt
 在设置按钮左边对齐约束时，若距屏幕左边框8pt，则frame的origin.x则为0
 若距屏幕左边框0pt，则frame左侧会被切掉8pt
 */
-(UIEdgeInsets)alignmentRectInsets{
    return UIEdgeInsetsMake(0, 8, 0, -8);
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    if ((point.x >= -8.0 || point.x <= width) && (point.y >=0 || point.y <= height)) {
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
