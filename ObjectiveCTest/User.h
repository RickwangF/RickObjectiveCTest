//
//  User.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/17.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic) NSString *UserName;
@property (nonatomic) int UserAge;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
