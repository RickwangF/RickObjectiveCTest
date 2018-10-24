//
//  DQCViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/24.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "DQCViewController.h"

@interface DQCViewController ()

-(void) getGlobalConcurrentQueue;

-(void) createDispatchQueue;

@end

@implementation DQCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self getGlobalConcurrentQueue];
    [self createDispatchQueue];
    // Do any additional setup after loading the view.
}

- (void)createDispatchQueue{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC * 1.5)), mainQueue, ^{
       self.view.backgroundColor = [UIColor redColor];
    });
}


- (void)getGlobalConcurrentQueue{
    dispatch_queue_t globalCQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(globalCQueue, ^{
        for (int i = 0; i<1000;i++){
            if (i == 999) {
                NSLog(@"Task 1 finished and current thread is %@", [NSThread currentThread]);
            }
        }
    });
    dispatch_async(globalCQueue, ^{
        for (int i = 0; i<1000;i++){
            if (i == 999) {
                NSLog(@"Task 2 finished and current thread is %@", [NSThread currentThread]);
            }
        }
    });
    dispatch_async(globalCQueue, ^{
        for (int i = 0; i<1000;i++){
            if (i == 999) {
                NSLog(@"Task 3 finished and current thread is %@", [NSThread currentThread]);
            }
        }
    });
    dispatch_async(globalCQueue, ^{
        for (int i = 0; i<1000;i++){
            if (i == 999) {
                NSLog(@"Task 4 finished and current thread is %@", [NSThread currentThread]);
            }
        }
    });
    
    dispatch_async(globalCQueue, ^{
        for (int i = 0; i<1000;i++){
            if (i == 999) {
                NSLog(@"Task 5 finished and current thread is %@", [NSThread currentThread]);
            }
        }
    });
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
