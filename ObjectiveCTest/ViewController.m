//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
#import "TestObject.h"


@interface ViewController ()

@property (nonatomic) TestObject *testObject;

-(BOOL)testWithBlock;

@end

@implementation ViewController

@synthesize testObject;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    testObject = [[TestObject alloc] init];
    BOOL flag = [testObject testBlock];
    
    if (flag == YES) {
        NSLog(@"flag is %@", @"YES");
    }
    else{
        NSLog(@"flag is %@", @"NO");
    }
    
    BOOL blockFlag = [self testWithBlock];
    if (blockFlag == YES) {
        NSLog(@"blockFlag is %@", @"YES");
    }
    else{
        NSLog(@"blockFlag is %@", @"NO");
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)testWithBlock{
    BOOL __block blockFlag = NO;
    [testObject testReturnWithBlock:^{
        blockFlag = YES;
    }];
    return blockFlag;
}


@end
