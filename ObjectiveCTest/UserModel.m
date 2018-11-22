//
//  UserModel.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/21.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

// Lazy init
-(NSString*)UserName{
    if (_UserName == nil) {
        _UserName = @"Rick";
    }
    return _UserName;
}

-(void)setUserName:(NSString *)UserName{
    if (![_UserName isEqualToString:UserName]) {
        _UserName = UserName;
    }
}

// Lazy init
-(NSInteger)Age{
    if (_Age == 0){
        _Age = 28;
    }
    return _Age;
}

- (void)PrintUserName{
    NSLog(@"UserName is %@", self.UserName);
}

@end
