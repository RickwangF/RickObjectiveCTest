//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

-(void) selectBarButtonItemSelected:(UIBarButtonItem*)sender;

-(void) earthBarButtonItemSelected:(UIBarButtonItem*)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航条";
//    self.navigationItem.prompt = @"这是系统的首页";
//    self.view.backgroundColor = [UIColor blueColor];
    UIBarButtonItem *selectBarItem = [[UIBarButtonItem alloc] initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(selectBarButtonItemSelected:)];
    UIBarButtonItem *earthBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"earth_25#2c.png"] style:UIBarButtonItemStylePlain target:self action:@selector(earthBarButtonItemSelected:)];
    self.navigationItem.leftBarButtonItems = @[selectBarItem, earthBarItem];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)selectBarButtonItemSelected:(UIBarButtonItem *)sender{
    NSLog(@"select barButtonItem Selected");
}

-(void)earthBarButtonItemSelected:(UIBarButtonItem *)sender{
    NSLog(@"earth barButtonItem Selected");
}

@end
