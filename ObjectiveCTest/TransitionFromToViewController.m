//
//  TransitionFromToViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/28.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "TransitionFromToViewController.h"

@interface TransitionFromToViewController ()

@property (nonatomic, strong) UIButton *animationBtn;

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIView * myView;

@property (nonatomic, strong) UILabel * myLabel;

@property (nonatomic, strong) UIView * replaceView;

@property (nonatomic, assign) CGFloat oriContainerX;

@property (nonatomic, assign) CGFloat oriContainerY;

@property (nonatomic, assign) CGFloat originX;

@property (nonatomic, assign) CGFloat originY;

@property (nonatomic, assign) CGFloat rectSize;

@end

@implementation TransitionFromToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initContaienrView];
    
    [self initMyView];
    
    [self initMyLabel];
    
    [self initAnimationBtn];
    
    [self initReplaceView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) initContaienrView{
    self.oriContainerX = self.view.frame.size.width / 2 - 100;
    self.oriContainerY = self.view.frame.size.height / 2 - 50;
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(self.oriContainerX, self.oriContainerY, 200, 100)];
    self.containerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.containerView];
}

-(void) initMyView{
    self.originX = self.containerView.frame.size.width / 2 - 25;
    self.originY = self.containerView.frame.size.height / 2 - 25;
    self.rectSize = 50;
    
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(self.originX, self.originY, self.rectSize, self.rectSize)];
    self.myView.backgroundColor = [UIColor greenColor];
    [self.containerView addSubview:self.myView];
}

-(void) initReplaceView{
    self.replaceView = [[UIView alloc] initWithFrame:CGRectMake(self.originX + 50, self.originY, self.rectSize, self.rectSize)];
    self.replaceView.backgroundColor = [UIColor redColor];
}

-(void) initMyLabel{
    self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.originX, self.originY, self.rectSize, self.rectSize)];
    self.myLabel.text = @"我是一串很长很长很长很长很长的字符串";
    self.myLabel.textColor = [UIColor blueColor];
    self.myLabel.font = [UIFont systemFontOfSize:15];
    //    [self.containerView addSubview:self.myLabel];
}

-(void) initAnimationBtn{
    CGFloat x = self.view.frame.size.width / 2 - 30;
    CGFloat y = 500;
    self.animationBtn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, 60, 30)];
    [self.animationBtn setTitle:@"开始" forState:UIControlStateNormal];
    [self.animationBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.animationBtn.layer.borderColor = [UIColor blueColor].CGColor;
    self.animationBtn.layer.borderWidth = 1.0;
    self.animationBtn.layer.cornerRadius = 3.0;
    self.animationBtn.clipsToBounds = YES;
    [self.animationBtn addTarget:self action:@selector(animationBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.animationBtn];
}

-(void) animationBtnClicked:(UIButton*)sender{
    [UIView transitionFromView:self.myView toView:self.replaceView duration:3.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        
    }];
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
