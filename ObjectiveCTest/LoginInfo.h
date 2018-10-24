//
//  LoginInfo.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/24.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginInfo : NSObject

@property (nonatomic) NSString* tokenKey;
@property (nonatomic) NSString* udid;

+(LoginInfo*)getSharedInstance;

+(void)setTokenKeyWithString:(NSString*)tokenString;

+(void)setUdidWithString:(NSString*)udidString;

@end

NS_ASSUME_NONNULL_END
