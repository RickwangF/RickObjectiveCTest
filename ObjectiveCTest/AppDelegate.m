//
//  AppDelegate.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 黑色背景，白色的标题字体
    //[UINavigationBar appearance].barStyle = UIBarStyleBlack;
    
    // 白色背景，黑色的标题字体
    [UINavigationBar appearance].barStyle = UIBarStyleDefault;
    
    // 设置导航条为不透明，取消半透明效果
//    [UINavigationBar appearance].translucent = NO;
    
    // 设置导航条中可交互控件的按钮标题字体颜色，按钮图片的颜色
    [UINavigationBar appearance].tintColor = [UIColor orangeColor];
    
    // 设置导航条的背景颜色
//    [UINavigationBar appearance].barTintColor = [UIColor purpleColor];
    
    // 设置导航条的backBarButtonItem的图片
    [UINavigationBar appearance].backIndicatorImage = [UIImage imageNamed:@"backcube_25#ff.png"];
    // 导航条push和pop过渡动画时当作mask显示的图片
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage imageNamed:@"backcube_25#ff.png"];
    
    // 设置导航条的标题的颜色，字体大小，文字阴影颜色，阴影的偏移量等
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor redColor];
    shadow.shadowOffset = CGSizeMake(10, 10);
    
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor greenColor], NSFontAttributeName: [UIFont systemFontOfSize:20 weight:UIFontWeightBold], NSShadowAttributeName: shadow};
    
    // 设置导航条标题的垂直对齐,第一个参数是y轴的偏移量，向下偏移是正值，向上的负值
    // UIBarMetricsDefault 正常竖屏状态，UIBarMetricsCompact 横屏状态
//    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:-10.0 forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航条的背景图片，可伸缩的图片会被自动拉伸到导航条实际尺寸
    // UIBarMetricsDefault 设置的背景图片在横竖屏都显示
    // UIBarMetricsCompact 设置的背景图片只有在横屏下才显示
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"translucentbg.jpg"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航条的背景图片，使用给定的导航条位置和标准
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_20.jpg"] forBarPosition:UIBarPositionTopAttached barMetrics: UIBarMetricsDefault];
    
    // 设置导航条的阴影图片，设置为一个没有尺寸的UIImage能隐藏默认的阴影横线
//    [[UINavigationBar appearance] setShadowImage: [UIImage new]];
    
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"40_heigh.png"] forBarPosition: UIBarPositionAny barMetrics: UIBarMetricsDefault];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
