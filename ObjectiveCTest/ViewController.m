//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
// 全局变量只能定义一次，但是使用extern声明为外部变量可以任意次
extern int intVariable;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"intVariable is %d", intVariable);
    // Do any additional setup after loading the view, typically from a nib.
}


@end
