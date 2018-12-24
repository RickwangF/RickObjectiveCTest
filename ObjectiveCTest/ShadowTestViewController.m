//
//  ShadowTestViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/12/13.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ShadowTestViewController.h"
#import "ShadowView.h"

@interface ShadowTestViewController ()

@property (nonatomic, strong) ShadowView *shadowView;

@end

@implementation ShadowTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_shadowView = [[ShadowView alloc] initWithFrame:CGRectMake(100, 200, 150, 150)];
	[self.view addSubview:_shadowView];
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
