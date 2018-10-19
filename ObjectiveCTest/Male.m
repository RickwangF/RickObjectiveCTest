//
//  male.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/18.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "Male.h"

@implementation Male

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)laugh{
    if (self.sneakers != nil && self.sneakers.count > 0) {
        NSLog(@"哈哈哈哈");
    }
    else{
        [super laugh];
    }
}

@end
