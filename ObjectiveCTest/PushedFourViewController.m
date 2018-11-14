//
//  PushedFourViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/14.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "PushedFourViewController.h"
#import <Masonry/Masonry.h>
#import "LeftImageButton.h"
#import "RightImageButton.h"

@interface PushedFourViewController ()

@property (nonatomic) LeftImageButton *leftBtn;

@property (nonatomic) RightImageButton *rightBtn;

-(void) leftBtnClicked:(LeftImageButton*)sender;

-(void) rightBtnClicked:(RightImageButton*)sender;

@end

@implementation PushedFourViewController

@synthesize leftBtn, rightBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    leftBtn = [[LeftImageButton alloc] initWithFrame:CGRectMake(10, 0, 100, 35)];
    [leftBtn setTitle:@"对齐矩形" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(8);
        make.centerY.equalTo(self.view);
        make.height.equalTo(@35);
    }];
    
    rightBtn = [[RightImageButton alloc] initWithFrame:CGRectMake(10, 0, 100, 35)];
    [rightBtn setTitle:@"对齐矩形" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];
    
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-8);
        make.centerY.equalTo(self.view);
        make.height.equalTo(@35);
    }];
    // Do any additional setup after loading the view.
}

-(void)leftBtnClicked:(LeftImageButton *)sender{
    NSLog(@"left btn clicked");
}

-(void)rightBtnClicked:(RightImageButton *)sender{
    NSLog(@"right btn clicked");
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
