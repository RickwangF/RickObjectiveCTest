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

-(void)testWithBlock;

@end

@implementation ViewController

@synthesize testObject;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    testObject = [[TestObject alloc] init];
//    BOOL flag = [testObject testBlock];
//
//    if (flag == YES) {
//        NSLog(@"flag is %@", @"YES");
//    }
//    else{
//        NSLog(@"flag is %@", @"NO");
//    }
//
//    BOOL blockFlag = [self testWithBlock];
//    if (blockFlag == YES) {
//        NSLog(@"blockFlag is %@", @"YES");
//    }
//    else{
//        NSLog(@"blockFlag is %@", @"NO");
//    }
    
//    BOOL flag = 255;
//    if (flag == YES) {
//        NSLog(@"flag is YES");
//    }
//
//    Boolean *boolean = 255;
//    if (boolean == FALSE) {
//        NSLog(@"boolean is FALSE");
//    }
//
//    __block NSString *string = @"rick is rick";
//    NSLog(@"string value location is %p in outside", string);
//
//    void(^block)(void) = ^(){
//        string = @"123";
//        NSLog(@"string value location is %p in block", string);
//    };
//
//    block();
//
//    NSLog(@"string value location is %p after block changed", string);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    [self testWithBlock];
}

- (void)testWithBlock{

    TestObject *objectTest = [[TestObject alloc] init];
    __weak TestObject *weakObj = objectTest;
    objectTest.block = ^{
        TestObject *strongObj = weakObj;
        [strongObj printLoginName];
    
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [strongObj printLoginName];
        });
    };
    objectTest.block();
    
}


@end
