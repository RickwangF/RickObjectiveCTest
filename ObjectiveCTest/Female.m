//
//  Female.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/18.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "Female.h"

@implementation Female

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)laugh{
    if (self.bags != nil && self.bags.count > 0) {
        NSLog(@"呵呵呵呵");
    }
    else{
        [super laugh];
    }
}

@end
