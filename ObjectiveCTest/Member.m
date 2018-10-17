//
//  Member.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/17.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "Member.h"

@implementation Member

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Rick";
        self.age = 20;
    }
    return self;
}

- (NSString *)getMemberName{
    return self.name;
}

- (void)setMemberName:(NSString *)name{
    self.name = name;
}

- (int)getMemberAge{
    return self.age;
}

- (void)setMemberAge:(int)age{
    self.age = age;
}

@end
