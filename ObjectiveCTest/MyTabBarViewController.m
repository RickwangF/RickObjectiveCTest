//
//  MyTabBarViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/15.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "CustomTabBar.h"

@interface MyTabBarViewController ()

-(void) initViewControllers;

@end

@implementation MyTabBarViewController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
    }
    return self;
}

// 在viewDidLoad方法中初始化ViewControllers
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取统一设置实例外观的实例
    UITabBarItem *appearance = [UITabBarItem appearance];
    // 初始化一个Dic设置UITabBarItem title的Attributes
    NSMutableDictionary *attrs = [[NSMutableDictionary alloc] init];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    // 设置tabBarItem的字体颜色和未选中图片的颜色一致
    attrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:112.0/255 green:112.0/255 blue:112.0/255 alpha:1.0];
    
    // 初始化一个Dic设置UITabBarItem title的selected Attributes
    NSMutableDictionary *selectAttrs = [[NSMutableDictionary alloc] init];
    selectAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    // 设置tabBarItem的字体颜色和选中图片的颜色一致
    selectAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:55.0/255 green:228.0/255 blue:24.0/255 alpha:1.0];
    // 统一设置实例的外观
    [appearance setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [appearance setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    // Do any additional setup after loading the view.
    
    // 设置自定义的UITabBar
    CustomTabBar *customTabBar = [[CustomTabBar alloc] init];
    [self setValue:customTabBar forKey: @"tabBar"];
    
    // 初始化ViewControllers
    [self initViewControllers];
}

- (void)initViewControllers{
    UIImage *imageOne = [UIImage imageNamed:@"home_25#70"];
    UIImage *imageOneSelected = [[UIImage imageNamed:@"home_25#green"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *imageTwo = [UIImage imageNamed:@"mine_25#70"];
    UIImage *imageTwoSelected = [[UIImage imageNamed:@"mine_25#green"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *itemOne = [[UITabBarItem alloc] initWithTitle:@"首页" image:imageOne selectedImage:imageOneSelected];
    
    UITabBarItem *itemTwo = [[UITabBarItem alloc] initWithTitle:@"我的" image:imageTwo selectedImage:imageTwoSelected];
    
    OneViewController *oneVC = [[OneViewController alloc] init];
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    
    oneVC.tabBarItem = itemOne;
    twoVC.tabBarItem = itemTwo;
    
    self.viewControllers = @[oneVC, twoVC];
    self.selectedViewController = oneVC;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
