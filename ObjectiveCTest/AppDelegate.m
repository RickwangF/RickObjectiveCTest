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
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    
    // 白色背景，黑色的标题字体
    [UINavigationBar appearance].barStyle = UIBarStyleDefault;
    
    // 设置导航条为不透明
    [UINavigationBar appearance].translucent = NO;
    
    // 设置导航条中可交互控件的按钮标题字体颜色，按钮图片的颜色
    [UINavigationBar appearance].tintColor = [UIColor orangeColor];
    
    // 设置导航条的背景颜色
    [UINavigationBar appearance].barTintColor = [UIColor purpleColor];
    
    // 设置导航条的标题的颜色，字体大小，文字阴影颜色，阴影的偏移量等
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor redColor];
    shadow.shadowOffset = CGSizeMake(10, 10);
    
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor greenColor], NSFontAttributeName: [UIFont systemFontOfSize:20 weight:UIFontWeightBold], NSShadowAttributeName: shadow};
    
    // 设置导航条标题的垂直对齐,第一个参数是y轴的偏移量，向下偏移是正值，向上的负值
    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:-20.0 forBarMetrics:UIBarMetricsDefault];
    
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
