//
//  LoginInfo.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/24.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "LoginInfo.h"

static LoginInfo* sharedInstance;

@implementation LoginInfo

+ (LoginInfo *)getSharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sharedInstance == nil){
            sharedInstance = [[LoginInfo alloc] init];
            sharedInstance.tokenKey = @"";
            sharedInstance.udid = @"";
        }
    });
    return sharedInstance;
}

+ (void)setTokenKeyWithString:(NSString *)tokenString{
    sharedInstance.tokenKey = tokenString;
}

+(void)setUdidWithString:(NSString *)udidString{
    sharedInstance.udid = udidString;
}

@end
