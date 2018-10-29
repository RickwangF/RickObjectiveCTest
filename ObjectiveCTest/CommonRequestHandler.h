//
//  CommonRequestHandler.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <YYModel/YYModel.h>
#import "JSONResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommonRequestHandler : NSObject

+(void) initializeHttpManager;

+(void) resetHttpManager;

+(void)get:(NSString *)url
withParams:(nullable id)parameters
     class:(Class)Class
   success:(nullable void (^)(_Nullable id responseObject))success
   failure:(nullable void (^)(NSError* error))failure;

+(void)post:(NSString *)url
 withParams:(nullable id)parameters
      class:(Class)Class
    success:(nullable void (^)(_Nullable id responseObject))success
    failure:(nullable void (^)(NSError* error))failure;

@end

NS_ASSUME_NONNULL_END
