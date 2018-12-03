//
//  AnimationViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/12/3.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "AnimationViewController.h"
#import "WhiteRoundView.h"

@interface AnimationViewController ()

@property (nonatomic, strong) UIButton *animationBtn;

@property (nonatomic, strong) UILabel *myLabel;

@property (nonatomic, strong) WhiteRoundView *roundView;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger number;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.number = 3;
    self.view.backgroundColor = [UIColor greenColor];
    self.centerX = self.view.frame.size.width / 2;
    self.centerY = self.view.frame.size.height / 2 ;
    
    [self initRoundView];
    [self initMyLabel];
    
    [self initAnimationBtn];
    // Do any additional setup after loading the view.
}

#pragma mark - Init Views

-(void)initRoundView{
    CGFloat originX = self.centerX - 25;
    CGFloat originY = self.centerY - 25;
    self.roundView = [[WhiteRoundView alloc] initWithFrame:CGRectMake(originX, originY, 50, 50)];
    self.roundView.layer.opacity = 0;
    [self.view addSubview:self.roundView];
}

-(void)initMyLabel{
    CGFloat originX = self.centerX - 25;
    CGFloat originY = self.centerY - 25;
    self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(originX, originY, 50, 50)];
    self.myLabel.opaque = NO;
    self.myLabel.textColor = [UIColor whiteColor];
    self.myLabel.font = [UIFont systemFontOfSize:50];
    self.myLabel.textAlignment = NSTextAlignmentCenter;
    self.myLabel.layer.opacity = 0;
    [self.view addSubview:self.myLabel];
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

#pragma mark - Init Timer

-(void)initTimer{
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(executeAnimation:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark - Action

-(void)animationBtnClicked:(UIButton*)sender{
    [self initTimer];
}

-(void)executeAnimation:(NSTimer*)sender{
    [self animationOne];
}

#pragma mark - Animation

-(void)animationOne{
    // 执行到1的时候就是最后一次执行了，这时候就可以移除timer了
    if (self.number <= 1) {
        [self.timer invalidate];
    }
    
    self.myLabel.text = [NSString stringWithFormat:@"%ld", (long)self.number];
    self.number--;
    
    // 创建改变Label缩放的动画
    CABasicAnimation *animationLabelScale = [CABasicAnimation animationWithKeyPath:@"transform"];
    animationLabelScale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    CATransform3D transfromLabelScale = CATransform3DMakeScale(3.0, 3.0, 1.0);
    animationLabelScale.toValue = [NSValue valueWithCATransform3D:transfromLabelScale];
    
    // 创建改变Label透明度的动画，这里使用关键帧是需要透明度提前变为1，清晰展示出数字
    CAKeyframeAnimation *animationLabelOpacity = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    animationLabelOpacity.values = @[@0, @0.5, @1, @1, @1, @1];
    animationLabelOpacity.keyTimes = @[@0, @0.2, @0.4, @0.6, @0.8, @1];
    animationLabelOpacity.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // 创建动画组包装Label的动画
    CAAnimationGroup *labelGroup = [CAAnimationGroup animation];
    // 设置动画时间
    labelGroup.duration = 0.8;
    // 设置动画数组
    labelGroup.animations = @[animationLabelScale, animationLabelOpacity];
    [self.myLabel.layer addAnimation:labelGroup forKey:@"group"];
    
    // 创建改变圆形背景缩放的动画
    CABasicAnimation *animationRoundScale = [CABasicAnimation animationWithKeyPath:@"transform"];
    animationRoundScale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    CATransform3D transfromRoundScale = CATransform3DMakeScale(6.0, 6.0, 1.0);
    animationRoundScale.toValue = [NSValue valueWithCATransform3D:transfromRoundScale];
    
    // 创建改变圆形背景透明度的动画
    CABasicAnimation *animationRoundOpacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animationRoundOpacity.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animationRoundOpacity.toValue = [NSNumber numberWithInt:1];
    
    // 创建动画组包装圆形背景的动画
    CAAnimationGroup *roundGroup = [CAAnimationGroup animation];
    // 设置动画时间
    roundGroup.duration = 0.5;
    // 设置动画数组
    roundGroup.animations = @[animationRoundScale, animationRoundOpacity];
    [self.roundView.layer addAnimation:roundGroup forKey:@"group"];
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
