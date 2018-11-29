//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initImageView];
    
    [self setCALayer];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initImageView{
    CGFloat originX = self.view.frame.size.width / 2 - 100;
    CGFloat originY = self.view.frame.size.height / 2 - 50;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originX, originY, 200, 100)];
    self.imageView.image = [UIImage imageNamed:@"daye"];
    [self.view addSubview:self.imageView];
}

-(void) setCALayer{
    self.imageView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
    self.imageView.layer.shadowOpacity = 0.5;
    
    self.imageView.layer.cornerRadius = 5.0;
    self.imageView.layer.masksToBounds = YES;
    
    self.imageView.layer.borderWidth = 2.0;
    self.imageView.layer.borderColor = [UIColor greenColor].CGColor;
    
    self.imageView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
}


@end
