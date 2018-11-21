//
//  UserModel.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/21.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (nonatomic, copy) NSString *UserName;

@property (nonatomic, assign) NSInteger Age;

-(instancetype)init;

-(void) PrintUserName;

@end

NS_ASSUME_NONNULL_END
