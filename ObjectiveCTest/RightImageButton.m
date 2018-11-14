//
//  RightImageButton.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/14.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "RightImageButton.h"

@implementation RightImageButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
 对齐矩形相对于Frame水平向左移动8pt，Frame相对于对齐矩形水平向右移动了8pt
 若设置按钮的右边距约束为-8pt，即距屏幕右边框8pt，则Frame的右边贴近屏幕并且距离为0
 */

-(UIEdgeInsets)alignmentRectInsets{
    return UIEdgeInsetsMake(0, -8, 0, 8);
}

@end
