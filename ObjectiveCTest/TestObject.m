//
//  TestObject.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/2.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.LoginName = @"Rick";
        self.Available = NO;
    }
    return self;
}

-(BOOL)testBlock{
    __block BOOL flag = NO;
    
    void(^block)(void) = ^(){
        flag = YES;
    };
    
    block();
    
    return flag;
}

- (void)testReturnWithBlock:(void (^)(void))block{    
    block();
}

@end
