//
//  SemaphoreViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/25.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "SemaphoreViewController.h"

@interface SemaphoreViewController ()

@property (nonatomic) void (^myBlock)(void);

-(void)createConcurrentDispatchQueueOne;

-(void)craeteConcurrentDispatchQueueTwo;

@end

@implementation SemaphoreViewController

dispatch_semaphore_t semaphore;
long semaCount = 0;
NSMutableArray *array;

- (void)viewDidLoad {
    [super viewDidLoad];
    semaphore = dispatch_semaphore_create(0);
    array = [[NSMutableArray alloc] init];
    
    self.myBlock = ^() {
        while (TRUE) {
            semaCount = dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            if (array.count > 0) {
                NSLog(@"%lu item remain and current thread is %@", (unsigned long)array.count, [NSThread currentThread]);
                [NSThread sleepForTimeInterval:0.1];
                [array removeLastObject];
            }
            else {
                NSLog(@"zero item remain and current thread is %@", [NSThread currentThread]);
                semaCount = dispatch_semaphore_signal(semaphore);
                NSLog(@"semaCount is %ld", semaCount);
                break;
            }
            semaCount = dispatch_semaphore_signal(semaphore);
        }
    };
    
    for (int i=0; i<100;i++) {
        [array addObject: [[NSNumber alloc] initWithInt:i]];
    }
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"array has %lu items now and begin to cowndown", (unsigned long)array.count);
    dispatch_semaphore_signal(semaphore);
    [self createConcurrentDispatchQueueOne];
    [self craeteConcurrentDispatchQueueTwo];
}

-(void)createConcurrentDispatchQueueOne{
    dispatch_queue_t queueOne = dispatch_queue_create("queueOne", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queueOne, self.myBlock);
    dispatch_async(queueOne, self.myBlock);
}

-(void)craeteConcurrentDispatchQueueTwo{
    dispatch_queue_t queueTwo = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queueTwo, self.myBlock);
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
