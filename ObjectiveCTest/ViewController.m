//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
#import "LoginInfo.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LoginInfo *loginInfo = [LoginInfo getSharedInstance];
    NSLog(@"loginInfo is %@ from viewDidLoad", loginInfo);
    NSLog(@"loginInfo's tokenKey is %@", loginInfo.tokenKey);
    NSLog(@"loginInfo's udid is %@", loginInfo.udid);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    LoginInfo *loginInfo = [LoginInfo getSharedInstance];
    NSLog(@"loginInfo is %@ from viewDidAppear", loginInfo);
    NSLog(@"loginInfo's tokenKey is %@", loginInfo.tokenKey);
    NSLog(@"loginInfo's udid is %@", loginInfo.udid);
}

@end
