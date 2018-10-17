//
//  User.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/17.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.UserAge = 20;
        self.UserName = @"Rick";
    }
    return self;
}

@end
