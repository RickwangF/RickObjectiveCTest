//
//  CommonRequestHandler.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "JSONResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommonRequestHandler : NSObject

+(void) initializeHttpManager;

+(void) setAuthorization:(NSString *)auth
               withToken:(NSString *)token
                 andUDID:(NSString *)udid;

+(void) resetHttpManager;

+(void)get:(NSString *)url
withParams:(nullable id)parameters
   success:(nullable void (^)(_Nullable id responseObject))success
   failure:(nullable void (^)(NSString *error))failure;

+(void)post:(NSString *)url
 withParams:(nullable id)parameters
    success:(nullable void (^)(_Nullable id responseObject))success
    failure:(nullable void (^)(NSString *error))failure;

@end

NS_ASSUME_NONNULL_END
