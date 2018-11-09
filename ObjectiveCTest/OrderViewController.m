//
//  OrderViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/8.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "OrderViewController.h"
#import "DetailViewController.h"
#import <Masonry/Masonry.h>

@interface OrderViewController ()

@property (nonatomic) UIButton *transitionBtn;

-(void) dismissItsSelfAndPresentToAnother;

@end

@implementation OrderViewController

@synthesize transitionBtn;

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
    }
    return self;
}

- (void)loadView{
    UIView *mainView = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    mainView.backgroundColor = [UIColor lightGrayColor];
    mainView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    transitionBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [transitionBtn setTitle:@"跳转并关闭自己" forState:UIControlStateNormal];
    [transitionBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [transitionBtn addTarget:self action:@selector(dismissItsSelfAndPresentToAnother) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:transitionBtn];
    
    [transitionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.mas_equalTo(35);
    }];
    // Do any additional setup after loading the view.
}

-(void)dismissLastViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dismissItsSelfAndPresentToAnother{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController:detailVC];
    detailVC.delegate = self;
    [self presentViewController:naviVC animated:true completion:nil];
    
//    [self presentViewController:naviVC animated:true completion:^{
//        [self dismissViewControllerAnimated:true completion:nil];
//    }];
//    [self dismissViewControllerAnimated:true completion:^{
//        [self presentViewController:naviVC animated:true completion:nil];
//    }];
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
