//
//  Human.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/18.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "Human.h"

@implementation Human

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = [[NSMutableString alloc] initWithString: @"human"];
        self.height = 160.0;
        self.weight = 50.5;
        self.snacks = [[NSMutableArray alloc] initWithObjects: [[NSMutableString alloc] initWithString:@"potato crisp"], nil];
    }
    return self;
}

- (void)laugh{
    NSLog(@"......");
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    id copy = [[[self class] allocWithZone:zone] init];
    if (copy == nil) {
        copy = [[Human allocWithZone:zone] init];
    }
    return copy;
}

@end


