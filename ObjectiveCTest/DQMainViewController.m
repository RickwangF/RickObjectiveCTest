//
//  DQMainViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/24.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "DQMainViewController.h"

@interface DQMainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *printBtn;
@property (weak, nonatomic) IBOutlet UIButton *durationBtn;

-(void)printBtnClicked:(UIButton*)sender;

-(void)durationBtnClicked:(UIButton*)sender;

@end

@implementation DQMainViewController

@synthesize printBtn, durationBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    [printBtn addTarget:self action:@selector(printBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [durationBtn addTarget:self action:@selector(durationBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)printBtnClicked:(UIButton *)sender{
    NSLog(@"printBtn was Clicked ------------------------");
}

- (void)durationBtnClicked:(UIButton *)sender{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_sync(mainQueue, ^{
        for(int i=0; i<=1000; i++) {
            if (i==1000) {
                NSLog(@"duration is passed and now current thread is %@", [NSThread currentThread]);
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
