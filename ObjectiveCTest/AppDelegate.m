//
//  AppDelegate.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建一个主窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = UIScreen.mainScreen.bounds;
    // 初始化自定义的UITabBarController
    MyTabBarViewController *myTabBarVC = [[MyTabBarViewController alloc] init];
    self.window.rootViewController = myTabBarVC;
    [self.window makeKeyAndVisible];
    
    // 初始化tabbarController和要加入他的VC
    //UITabBarController *tabVC = [[UITabBarController alloc] init];
    //OneViewController *oneVC = [[OneViewController alloc] init];
    //TwoViewController *twoVC = [[TwoViewController alloc] init];
    // 初始化一张Image，并设置其渲染模式为AlwaysOriginal，为了防止系统将其修改成蓝色
    //UIImage *imageOneSelected = [[UIImage imageNamed:@"solidhome_25#green.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //UIImage *imageOne = [UIImage imageNamed:@"home_25#70.png"];
    // 初始化一个tabbarItem，并设置其标题，未选中的图片，选中的图片
    //UITabBarItem *oneTabItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:imageOne selectedImage:imageOneSelected];
    // 设置tabbarItem的标题的特性，此处只设置了字体的颜色
    //[oneTabItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:55.0/255 green:228.0/255 blue:24.0/255 alpha:1.0]} forState:UIControlStateSelected];
    
    // 设置tabBarItem的title的偏移量,水平方向正为right，垂直方向正为bottom
    //oneTabItem.titlePositionAdjustment = UIOffsetMake(20, 10);
    
    // 设置标记的数值
    //oneTabItem.badgeValue = @"1";
    
    // 设置标记的颜色
//    oneTabItem.badgeColor = [UIColor colorWithRed:55.0/255 green:228.0/255 blue:24.0/255 alpha:1.0];
    
    // 根据状态设置标记的文字特性
//    [oneTabItem setBadgeTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:40], NSForegroundColorAttributeName: [UIColor blueColor]} forState:UIControlStateNormal];
    
    
//    UIImage *imageTwoSelected = [[UIImage imageNamed:@"solidmine_25#green"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIImage *imageTwo = [UIImage imageNamed:@"mine_25#70.png"];
//    UITabBarItem *twoTabItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:imageTwo selectedImage:imageTwoSelected];
//
//    [twoTabItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:55.0/255 green:228.0/255 blue:24.0/255 alpha:1.0]} forState:UIControlStateSelected];
//
//    // 将创建好的tabbarItem赋值给ViewController的tabBarItem属性
//    oneVC.tabBarItem = oneTabItem;
//    twoVC.tabBarItem = twoTabItem;
//    // 设置tabbarController的viewControllers属性
//    tabVC.viewControllers = @[oneVC, twoVC];
//    // 设置初始选择的控制器
//    tabVC.selectedViewController = oneVC;
//    self.window.rootViewController = tabVC;
//    [self.window makeKeyAndVisible];
    
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
