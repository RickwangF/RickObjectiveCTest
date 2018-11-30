//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
#import "RoundView.h"

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIButton *animationBtn;

@property (nonatomic, strong) RoundView *roundView;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.centerX = self.view.frame.size.width / 2;
    self.centerY = self.view.frame.size.height / 2 ;
    
    [self initRoundView];
    
    [self initAnimationBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Init View

-(void)initRoundView{
    CGFloat originX = self.centerX - 100;
    CGFloat originY = self.centerY - 100;
    self.roundView = [[RoundView alloc] initWithFrame:CGRectMake(originX, originY, 200, 200)];
    [self.view addSubview:self.roundView];
}

-(void)initAnimationBtn{
    CGFloat originX = self.centerX - 50;
    CGFloat originY = self.centerY + 200;
    self.animationBtn = [[UIButton alloc] initWithFrame:CGRectMake(originX, originY, 100, 50)];
    [self.animationBtn setTitle:@"动画" forState:UIControlStateNormal];
    [self.animationBtn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [self.animationBtn addTarget:self action:@selector(animationBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.animationBtn.layer.cornerRadius = 5.0;
    self.animationBtn.layer.borderColor = UIColor.blueColor.CGColor;
    self.animationBtn.layer.borderWidth = 1.0;
    self.animationBtn.layer.masksToBounds = YES;
    [self.view addSubview:self.animationBtn];
}

#pragma mark - Animation

-(void)animationBtnClicked:(UIButton*)sender{
    [self transfromRotation];
}

// 第一种平移
-(void)basicAnimationTrasnlate{
    // 根据要使用动画改变的layer的属性创建CABasicAnimation对象
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    // 设置动画的持续时间
    animation.duration = 2;
    // 设置动画开始时属性的值
    animation.fromValue = [NSValue valueWithCGPoint:self.roundView.layer.position];
    // 设置动画结束时属性的值
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.centerX, 0)];
    // 设置动画的时间函数
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // 设置动画结束后是否移除动画
    animation.removedOnCompletion = NO;
    // 动画结束后保持动画结束时layer的状态
    animation.fillMode = kCAFillModeForwards;
    // 设置动画的代理为当前ViewController
    animation.delegate = self;
    [self.roundView.layer addAnimation:animation forKey:@"myAnimation"];
}

// 第二种平移
-(void)caTransform3dtranslate{
    // 使用CALayer的transform属性进行平移
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration = 3.0;
    // 设置CATransform3D为平移
    CATransform3D transform = CATransform3DMakeTranslation(-200, -200, 0);
    // 设置动画结束时transfrom属性的值
    animation.toValue = [NSValue valueWithCATransform3D:transform];
    // 添加动画并命名
    [self.roundView.layer addAnimation:animation forKey:@"translate"];
}

-(void)basicScale{
    // 创建修改bounds属性的CABasicAnimation对象
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animation.duration = 3.0;
    // 设置bounds将要改变的值
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 1000, 1000)];
    // 添加动画并命名
    [self.roundView.layer addAnimation:animation forKey:@"bounds"];
}

-(void)transfromScale{
    // 创建修改transfrom属性的CABasicAnimation对象
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration = 3.0;
    // 设置transform的内容
    CATransform3D transfromOne = CATransform3DMakeScale(2.0, 2.0, 1);
    animation.toValue = [NSValue valueWithCATransform3D:transfromOne];
    [self.roundView.layer addAnimation:animation forKey:@"scale"];
}

-(void)transfromRotation{
    // 创建修改transfrom属性的CABasicAnimation对象
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration = 3.0;
    // 设置transform的内容为绕（1，0，0）这个向量旋转45度
    CATransform3D transfrom = CATransform3DMakeRotation(45, 1, 0, 0);
    animation.toValue = [NSValue valueWithCATransform3D:transfrom];
    [self.roundView.layer addAnimation:animation forKey:@"rotation"];
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"动画开始了");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"动画结束了");
}

@end
