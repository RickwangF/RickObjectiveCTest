//
//  PushedThreeViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/13.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "PushedThreeViewController.h"
#import "LeftImageButton.h"

@interface PushedThreeViewController ()

@property (nonatomic) LeftImageButton *customBtn;

-(void) addBtnClicked:(UIButton*)sender;

-(void) testBtnClicked:(UIButton*)sender;

@end

@implementation PushedThreeViewController

@synthesize customBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    customBtn = [[LeftImageButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [customBtn addTarget:self action:@selector(testBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [customBtn setTitle:@"测试按钮" forState:UIControlStateNormal];
    [customBtn setImage:[UIImage imageNamed:@"add_25#blue"] forState: UIControlStateNormal];
    [customBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    customBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [customBtn sizeToFit];
    customBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:customBtn];
    UIBarButtonItem *fixedSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpaceItem.width = 6;
    
    self.navigationItem.leftBarButtonItems = @[fixedSpaceItem, leftBarItem];
    // Do any additional setup after loading the view.
}

- (void)addBtnClicked:(UIButton *)sender{
    NSLog(@"add Btn Clicked");
}

-(void)testBtnClicked:(UIButton *)sender{
    NSLog(@"test Btn Clicked");
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
