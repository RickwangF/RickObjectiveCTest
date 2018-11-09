//
//  DetailViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/8.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "DetailViewController.h"
#import <Masonry/Masonry.h>

@interface DetailViewController ()

@property (nonatomic) UIButton* dismissBtn;

-(void)dismissThisView;

@end

@implementation DetailViewController

@synthesize dismissBtn, delegate;

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
    }
    return self;
}

- (void)loadView{
    UIView *mainView = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    mainView.backgroundColor = [UIColor whiteColor];
    mainView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dismissBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [dismissBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [dismissBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [dismissBtn addTarget:self action:@selector(dismissThisView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissBtn];
    
    [dismissBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.mas_equalTo(35);
    }];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.delegate != nil) {
        [delegate dismissLastViewController];
    }
}


-(void)dismissThisView{
    [self dismissViewControllerAnimated:true completion:nil];
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
