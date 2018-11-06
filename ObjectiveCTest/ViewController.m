//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "People.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(foo)];
    [self performSelector:@selector(barWithString:) withObject:@"rick"];
    // Do any additional setup after loading the view, typically from a nib.
}

// 消息转发的第一阶段，是否能够解析实例的方法，返回NO会调用forwardingTargetForSelector
// 看是否有目标对象可以响应该消息
+(BOOL)resolveInstanceMethod:(SEL)sel{
    return NO;
}

// 根据SEL判断目标类型能否响应该消息，能够响应该消息则返回目标对象
// 返回nil进入完整的消息转发流程
-(id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(foo)) {
        return [[People alloc] init];
    }
    else if (aSelector == @selector(barWithString:)) {
        return [[People alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
