//
//  SubLayerViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "SubLayerViewController.h"

@interface SubLayerViewController ()

@end

@implementation SubLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubLayer];
    // Do any additional setup after loading the view.
}

-(void)initSubLayer {
    CGFloat originX = self.view.frame.size.width / 2;
    CGFloat originY = self.view.frame.size.height / 2;
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(originX, originY);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    layer.cornerRadius = 5.0;
    layer.masksToBounds = YES;
    
    layer.contents = (id)[UIImage imageNamed:@"daye"].CGImage;
    
    
    [self.view.layer addSublayer:layer];
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
