//
//  DataCache.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/2.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYCache/YYCache.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataCache : NSObject

+(void) initDataCache;

+(nullable id) getDataWithKey:(NSString*)key;

+(void) setData:(id)data withKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
