//
//  LoginViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/22.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"

__weak ViewController* vc;

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:NSBundle.mainBundle];
    vc = [storyBoard instantiateViewControllerWithIdentifier: @"view"];
    // Do any additional setup after loading the view.
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
