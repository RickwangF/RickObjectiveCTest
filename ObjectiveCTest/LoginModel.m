//
//  LoginModel.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/26.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
    
- (instancetype)init
    {
        self = [super init];
        if (self) {
            self.LoginName = @"";
            self.Password = @"";
            self.Client = @"";
            self.UDID = @"";
        }
        return self;
    }

-(NSDictionary *)toDictionary{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:self.LoginName,@"LoginName",self.Password,@"Password",self.Client,@"Client",self.UDID,@"UDID", nil];
    return dic;
}
    
@end
