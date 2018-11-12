//
//  PushedOneViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/12.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "PushedOneViewController.h"

@interface PushedOneViewController ()

-(void) leftBarButtonItemClicked:(UIBarButtonItem*)sender;

@end

@implementation PushedOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClicked:)];
    
    // 解决侧滑返回失效的问题，将交互的弹出手势识别器的代理设置为自己
//    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
    
    /* By default, the leftItemsSupplementBackButton property is NO. In this case,
     the back button is not drawn and the left item or items replace it. If you
     would like the left items to appear in addition to the back button (as opposed to instead of it)
     set leftItemsSupplementBackButton to YES.
     */
//    self.navigationItem.leftItemsSupplementBackButton = YES;
    
    // Do any additional setup after loading the view.
}

- (void)leftBarButtonItemClicked:(UIBarButtonItem *)sender{
    NSLog(@"pushed one VC left bar button item clicked");
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
