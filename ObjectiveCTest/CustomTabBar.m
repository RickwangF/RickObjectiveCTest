//
//  CustomTabBar.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/15.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "CustomTabBar.h"

@interface CustomTabBar ()

-(void) customInit;

@end

@implementation CustomTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

-(void)customInit{
    // 设置barStyle样式
    //self.barStyle = UIBarStyleBlack;
    
    // 设置关闭半透明效果
    //self.translucent = NO;
    
    // 不推荐使用
    // 设置tabBarItem的字体和图片颜色，会被UITabBarItem覆盖
    //self.tintColor = [UIColor redColor];
    
    // 不推荐使用
    // 设置未被选择的tabBarItem的字体颜色和图片，字体颜色会被UITabBarItem覆盖
    // 图片颜色不会被UITabBarItem覆盖
    //self.unselectedItemTintColor = [UIColor redColor];
    
    // 不推荐使用
    // 设置选中标签的图片的颜色，会被UITabBarItem覆盖
    //self.selectedImageTintColor = [UIColor whiteColor];
    
    // 设置tabBar的背景颜色
    //self.barTintColor = [UIColor yellowColor];
    
    // 设置tabBar的背景完全透明
    //self.backgroundImage = [UIImage new];
    //self.shadowImage = [UIImage new];
    
    // 设置被选中标签的指示图片，默认是nil，指示图片的位置在tabBar上方，tabBarItem内容的下方
//    self.selectionIndicatorImage = [UIImage imageNamed:@"solidhome_25#green"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
