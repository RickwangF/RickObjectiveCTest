//
//  DGViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/24.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "DGViewController.h"

@interface DGViewController ()

-(void) createConcurrentDQ;

-(void) createGlobalConCurrentDQ;

-(void) createSerialDQ;

-(void) notifyGroupFinished;

@end

@implementation DGViewController

dispatch_group_t group;
int count = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    group = dispatch_group_create();
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self createGlobalConCurrentDQ];
//        [self createSerialDQ];
        [self createConcurrentDQ];
    });
}

- (void)createSerialDQ{
    dispatch_group_enter(group);
    dispatch_queue_t queueS = dispatch_queue_create("queueS", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queueS, ^{
        for (int i = 0; i<=5000000; i++) {
            if (i==5000000) {
                count = i;
                NSLog(@"Serial Dispatch Queue Finished Async Task 1 and now thread is %@", [NSThread currentThread]);
            }
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queueS, ^{
        for (int i=0; i<=1000; i++) {
            if (i==1000) {
                NSLog(@"Serial Dispatch Queue Finished Async Task 2 and now thread is %@", [NSThread currentThread]);
            }
        }
        dispatch_group_leave(group);
    });
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
}

-(void)createConcurrentDQ{
    dispatch_group_enter(group);
    NSLog(@"now count is %d", count);
    dispatch_queue_t queueC = dispatch_queue_create("queueC", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queueC, ^{
        for (int i = count; i<=6000000; i++) {
            if (i==6000000) {
                NSLog(@"Concurrent Dispatch Queue Finished Async Task and now thread is %@", [NSThread currentThread]);
                count = 6000000;
            }
        }
        dispatch_group_leave(group);
        [self notifyGroupFinished];
    });
}

-(void)createGlobalConCurrentDQ{
    dispatch_group_enter(group);
    dispatch_queue_t queueG = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queueG, ^{
        
        [NSThread sleepForTimeInterval: 4];
        NSLog(@"Global Concurrent Dispatch Queue Finished Async Task 1 and now thread is %@", [NSThread currentThread]);
        count = 100;
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(queueG, ^{
        
        [NSThread sleepForTimeInterval: 3];
        NSLog(@"Global Concurrent Dispatch Queue Finished Async Task 2 and now thread is %@", [NSThread currentThread]);
        count = 20000;
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(queueG, ^{
        
        [NSThread sleepForTimeInterval: 2];
        NSLog(@"Global Concurrent Dispatch Queue Finished Async Task 3 and now thread is %@", [NSThread currentThread]);
        count = 2000;
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(queueG, ^{
        
        [NSThread sleepForTimeInterval: 1];
        NSLog(@"Global Concurrent Dispatch Queue Finished Async Task 4 and now thread is %@", [NSThread currentThread]);
        count = 5000000;
        dispatch_group_leave(group);
    });
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
}

-(void)notifyGroupFinished{
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        self.view.backgroundColor = [UIColor redColor];
        NSLog(@"all dispatch queue task had finished and now thread is %@", [NSThread currentThread]);
        NSLog(@"count is %d", count);
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
