//
//  UserModel.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/5.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (nonatomic, copy) NSString *LoginName;
@property (nonatomic, assign) BOOL Available;

-(instancetype)init;

-(void) printLoginName;

-(void) printRealName;

@end

NS_ASSUME_NONNULL_END
