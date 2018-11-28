//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, strong) UIButton *animationBtn;

@property (nonatomic, strong) UIView * myView;

@property (nonatomic, assign) CGFloat originX;

@property (nonatomic, assign) CGFloat originY;

@property (nonatomic, assign) CGFloat rectSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMyView];
    
    [self initAnimationBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) initMyView{
    self.originX = self.view.frame.size.width / 2 - 25;
    self.originY = self.view.frame.size.height / 2 - 25;
    self.rectSize = 50;
    
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(self.originX, self.originY, self.rectSize, self.rectSize)];
    self.myView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.myView];
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
    CGPoint center = self.myView.center;
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGPoint centerAnimation = CGPointMake(center.x, center.y - 100);
        self.myView.center = centerAnimation;
        self.myView.backgroundColor = [UIColor redColor];
        
    } completion:^(BOOL finished) {
        self.myView.center = center;
        self.myView.backgroundColor = [UIColor greenColor];
    }];
}

@end
