//
//  DrawLayerViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "DrawLayerViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MyLayer.h"

@interface DrawLayerViewController ()<CALayerDelegate>

@end

@implementation DrawLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMyLayer];
    
    // Do any additional setup after loading the view.
}
    //第二种方式
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
}

-(void)initMyLayer{
    CGFloat originX = self.view.frame.size.width / 2;
    CGFloat originY = self.view.frame.size.height / 2;
    MyLayer *myLayer = [MyLayer layer];
    myLayer.backgroundColor = [UIColor redColor].CGColor;
    myLayer.bounds = CGRectMake(0, 0, 250, 150);
    myLayer.position = CGPointMake(originX, originY);
    
    // 设置layer需要被更新，才会调用drawInContext
    [myLayer setNeedsDisplay];
    [self.view.layer addSublayer:myLayer];
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
