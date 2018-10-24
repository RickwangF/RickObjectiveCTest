//
//  GCDViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/23.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@property (nonatomic) UIImageView *imageView;

-(void) createDispatchQueue;

-(void) initImageView;

-(void) updateImageViewWithImage:(UIImage *)image;

@end

@implementation GCDViewController

@synthesize imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self initImageView];
    [self createDispatchQueue];
}

- (void)initImageView{
    imageView = [[UIImageView alloc] initWithFrame: CGRectMake(107, 50, 200, 200)];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageView];
}

-(void)createDispatchQueue{
    dispatch_queue_t queueC = dispatch_queue_create("queueC", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queueC, ^{
        for (int i = 0; i<1000;i++){
            if (i == 999) {
                NSLog(@"Task 1 finished and current thread is %@", [NSThread currentThread]);
            }
        }
    });
    dispatch_async(queueC, ^{
        for (int i = 0; i<1000;i++){
            if (i == 999) {
                NSLog(@"Task 2 finished and current thread is %@", [NSThread currentThread]);
            }
        }
    });
    dispatch_async(queueC, ^{
        for (int i = 0; i<1000;i++){
            if (i == 999) {
                NSLog(@"Task 3 finished and current thread is %@", [NSThread currentThread]);
            }
        }
    });
    dispatch_async(queueC, ^{
        for (int i = 0; i<1000;i++){
            if (i == 999) {
                NSLog(@"Task 4 finished and current thread is %@", [NSThread currentThread]);
            }
        }
    });
    
    dispatch_async(queueC, ^{
        for (int i = 0; i<1000;i++){
            if (i == 999) {
                NSLog(@"Task 5 finished and current thread is %@", [NSThread currentThread]);
            }
        }
    });
    
//    dispatch_sync(queueC, ^{
//        NSLog(@"1 and current thread is %@", [NSThread currentThread]);
//    });
//    dispatch_sync(queueC, ^{
//        NSLog(@"2 and current thread is %@", [NSThread currentThread]);
//        for (int i = 0; i<5000;i++){
//            NSLog(@"Task 2 is on process");
//        }
//    });
//    dispatch_sync(queueC, ^{
//        NSLog(@"3 and current thread is %@", [NSThread currentThread]);
//    });
//    dispatch_sync(queueC, ^{
//        NSLog(@"4 and current thread is %@", [NSThread currentThread]);
//    });
//    dispatch_sync(queueC, ^{
//        NSLog(@"5 and current thread is %@", [NSThread currentThread]);
//    });
    
//    dispatch_queue_t queueS = dispatch_queue_create("queueS", DISPATCH_QUEUE_SERIAL);
//
//    dispatch_async(queueS, ^{
//        NSLog(@"1 and current thread is %@", [NSThread currentThread]);
//    });
//    dispatch_async(queueS, ^{
//        NSLog(@"2 and current thread is %@", [NSThread currentThread]);
//        for (int i = 0; i<5000;i++){
//            NSLog(@"Task 2 is on process");
//        }
//    });
//    dispatch_async(queueS, ^{
//        NSLog(@"3 and current thread is %@", [NSThread currentThread]);
//    });
//    dispatch_async(queueS, ^{
//        NSLog(@"4 and current thread is %@", [NSThread currentThread]);
//    });
//    dispatch_async(queueS, ^{
//        NSLog(@"5 and current thread is %@", [NSThread currentThread]);
//    });
    
//    dispatch_sync(queueS, ^{
//        NSLog(@"5 and current thread is %@", [NSThread currentThread]);
//    });
//    dispatch_sync(queueS, ^{
//        NSLog(@"4 and current thread is %@", [NSThread currentThread]);
//    });
//    dispatch_sync(queueS, ^{
//        NSLog(@"3 and current thread is %@", [NSThread currentThread]);
//    });
//    dispatch_sync(queueS, ^{
//        NSLog(@"2 and current thread is %@", [NSThread currentThread]);
//    });
//    dispatch_sync(queueS, ^{
//        NSLog(@"1 and current thread is %@", [NSThread currentThread]);
//    });
}

- (void)updateImageViewWithImage:(UIImage *)image{
    imageView.image = image;
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
