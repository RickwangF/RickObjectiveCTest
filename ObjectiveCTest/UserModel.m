//
//  UserModel.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/5.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

// extension 定义开始
@interface UserModel ()
// 在.m文件中定义的扩展的属性是私有的
@property (nonatomic, copy) NSString *realName;

@end
// extension 定义结束
NS_ASSUME_NONNULL_END

@implementation UserModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.LoginName = @"Rick";
        self.Available = YES;
        self.realName = @"Rick Wang";
    }
    return self;
}

-(void)printLoginName{
    NSLog(@"User's LoginName is %@", self.LoginName);
}

-(void) printRealName {
    NSLog(@"real is %@", self.realName);
}

@end
