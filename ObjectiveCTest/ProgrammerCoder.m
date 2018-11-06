//
//  ProgrammerCoder.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/6.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ProgrammerCoder.h"

@implementation ProgrammerCoder

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"programmer";
    }
    return self;
}

#pragma mark - Programmer
-(void)doWork{
    NSLog(@"%@ is Coding now!!", self.name);
}

- (void)getRest {
    NSLog(@"%@ is having braek for 10 minutes", self.name);
}

-(void)getHome{
    NSLog(@"%@ is getting Home with his bike", self.name);
}

@end
