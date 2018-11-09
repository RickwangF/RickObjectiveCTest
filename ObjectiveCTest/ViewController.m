//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "ListViewController.h"

@interface ViewController ()

@property (nonatomic) UIButton *presentBtn;

-(void) presentBtnClicked:(UIButton*)sender;

@end

@implementation ViewController

@synthesize presentBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    presentBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [presentBtn setTitle:@"跳转" forState:UIControlStateNormal];
    [presentBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [presentBtn addTarget:self action:@selector(presentBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentBtn];
    
    [presentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.equalTo(@35);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)presentBtnClicked:(UIButton *)sender{
    ListViewController *listVC = [[ListViewController alloc] init];
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:listVC];
    [self presentViewController:naviVC animated:YES completion:nil];
}


@end
