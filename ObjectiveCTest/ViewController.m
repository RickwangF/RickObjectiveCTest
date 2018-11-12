//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
#import "PushedOneViewController.h"
#import "PushedTwoViewController.h"
#import "UIImage+UIColor.h"


@interface ViewController ()

-(void) selectBarButtonItemSelected:(id)sender;

-(void) earthBarButtonItemSelected:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航条";
//    self.navigationItem.prompt = @"这是系统的首页";
    self.view.backgroundColor = [UIColor blueColor];
//    self.extendedLayoutIncludesOpaqueBars = YES;
    // 在RootViewController中在导航条上设置barButtonItem会出现hightlight off的bug
    UIBarButtonItem *selectBarItem = [[UIBarButtonItem alloc] initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(selectBarButtonItemSelected:)];
    UIBarButtonItem *earthBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"earth_25#2c.png"] style:UIBarButtonItemStylePlain target:self action:@selector(earthBarButtonItemSelected:)];
    // 使用UIBarButtonItem initWithCustomView不会出现该Bug
    UIButton *selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 35)];
    [selectBtn addTarget:self action:@selector(selectBarButtonItemSelected:) forControlEvents:UIControlEventTouchUpInside];
    [selectBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [selectBtn sizeToFit];
    [selectBtn setTitle:@"选择" forState:UIControlStateNormal];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:selectBtn];
    
    self.navigationItem.leftBarButtonItem = customBarItem;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 设置导航条完全透明
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 还原默认的导航条样式
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithUIColor:[UIColor colorWithWhite:0.97 alpha:0.8]] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage imageWithUIColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
}

- (void)selectBarButtonItemSelected:(UIBarButtonItem *)sender{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle: NSBundle.mainBundle];
    PushedTwoViewController *pushedVC = [storyBoard instantiateViewControllerWithIdentifier:@"pushedTwoView"];
    [self.navigationController pushViewController:pushedVC animated:YES];
    NSLog(@"select barButtonItem Selected");
}

-(void)earthBarButtonItemSelected:(UIBarButtonItem *)sender{
    NSLog(@"earth barButtonItem Selected");
}

@end
