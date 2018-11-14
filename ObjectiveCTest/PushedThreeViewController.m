//
//  PushedThreeViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/13.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "PushedThreeViewController.h"
#import "LeftImageButton.h"
#import "RightImageButton.h"

@interface PushedThreeViewController ()

@property (nonatomic) LeftImageButton *leftBtn;

@property (nonatomic) RightImageButton *rightBtn;

-(void) testBtnClicked:(UIButton*)sender;

-(void) leftBtnClicked:(UIButton*)sender;

-(void) rightBtnClicked:(UIButton*)sender;

@end

@implementation PushedThreeViewController

@synthesize leftBtn, rightBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    containerView.layer.borderColor = [[UIColor redColor] CGColor];
    containerView.layer.borderWidth = 1.0f;
    UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(-16, 0, 100, 35)];
    testBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [testBtn setTitle:@"左侧按钮" forState:UIControlStateNormal];
    [testBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:testBtn];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:containerView];
    self.navigationItem.leftBarButtonItem = leftBarItem;

    
//    leftBtn = [[LeftImageButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
//    [leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [leftBtn setTitle:@"左侧按钮" forState:UIControlStateNormal];
//    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    // 这个是关键，因为UINavigationBar中使用了AutoLayout，不需要frame等信息决定约束
//    leftBtn.translatesAutoresizingMaskIntoConstraints = NO;
//
//    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
//    UIBarButtonItem *fixedSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    fixedSpaceItem.width = 6;
//
//    self.navigationItem.leftBarButtonItems = @[fixedSpaceItem, leftBarItem];
    
    
    
//    UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
//    testBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [testBtn setTitle:@"左侧按钮" forState:UIControlStateNormal];
//    [testBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    UIBarButtonItem *testBarItem = [[UIBarButtonItem alloc] initWithCustomView:testBtn];
//
//    UIBarButtonItem *fixedSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//        fixedSpaceItem.width = 6;
//
//    self.navigationItem.leftBarButtonItems = @[fixedSpaceItem, testBarItem];
}

- (void)testBtnClicked:(UIButton *)sender{
    NSLog(@"test btn clicked");
}

-(void)leftBtnClicked:(UIButton *)sender{
    NSLog(@"left btn clicked");
}

-(void)rightBtnClicked:(UIButton *)sender{
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
