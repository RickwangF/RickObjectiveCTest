//
//  PMSpeaker.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/6.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "PMSpeaker.h"

@implementation PMSpeaker

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"productManager";
    }
    return self;
}

#pragma mark - ProductManager
- (void)planToDo {
    NSLog(@"%@ is planning to do a project", self.name);
}

- (void)watchToDo {
    NSLog(@"%@ is checking work today", self.name);
}

- (void)backToHome{
    NSLog(@"%@ is driving home now!!", self.name);
}

@end
