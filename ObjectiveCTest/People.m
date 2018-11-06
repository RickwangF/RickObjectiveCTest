//
//  People.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/6.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "People.h"

@implementation People

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)foo{
    NSLog(@"People instance have executed foo selector");
}

-(void)barWithString:(NSString *)string{
    NSLog(@"People instance have executed bar selector with %@", string);
}

@end
