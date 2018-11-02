//
//  LoginResult.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginResult : NSObject

@property (nonatomic, copy) NSString *Token;
@property (nonatomic) UserModel *UserModel;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
