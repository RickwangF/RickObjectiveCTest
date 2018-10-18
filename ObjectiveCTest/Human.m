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
        self.name = @"human";
        self.height = 160.0;
        self.weight = 50.5;
        self.snacks = [[NSMutableArray alloc] initWithObjects: @"crisp", nil];
    }
    return self;
}

- (void)laugh{
    NSLog(@"......");
}

@end
