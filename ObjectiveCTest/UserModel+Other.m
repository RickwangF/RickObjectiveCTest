//
//  UserModel+Other.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/5.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "UserModel+Other.h"

@implementation UserModel (Other)

-(void)printUserAvailable{
    NSLog(@"user's available is %@", self.Available == YES ? @"YES" : @"NO");
}

@end
