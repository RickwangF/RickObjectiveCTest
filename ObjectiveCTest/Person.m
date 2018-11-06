//
//  Person.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/6.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Rick";
        self.age = 28;
        self.gender = Male;
    }
    return self;
}

@end
