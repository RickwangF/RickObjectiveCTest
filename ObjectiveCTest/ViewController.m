//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"

// 定义在此的变量是private的，只有在本类中才能使用
__weak NSString *stringA = nil;
__weak NSString *stringB = nil;
__weak NSString *stringC = nil;

@interface ViewController ()
// 定义在此的属性是private的，只有在本类中才能使用
@property (weak, nonatomic) IBOutlet UILabel *labelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    NSString *strA = [NSString stringWithFormat:@"rick is A"];
    stringA = strA;
    
    @autoreleasepool {
        NSString *strB = [NSString stringWithFormat:@"rick is B"];
        stringB = strB;
    }
    
    NSString *strC = nil;
    
    @autoreleasepool {
        strC = [NSString stringWithFormat:@"rick is C"];
        stringC = strC;
    }
    
    NSLog(@"viewDidLoad");
    [self showStrings];
    
    // autorelease pool loop situation
    for (int i = 0; i< 1000000; i++) {
        @autoreleasepool{
            UIImage *image = [UIImage imageNamed: @"guide_1.png"];
            NSLog(@"image width is %f and height is %f", image.size.width, image.size.height);
        }
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    [self showStrings];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
    [self showStrings];
}

- (void)showStrings{
    NSLog(@"stringA is %@", stringA);
    NSLog(@"stringB is %@", stringB);
    NSLog(@"stringC is %@", stringC);
}

@end
