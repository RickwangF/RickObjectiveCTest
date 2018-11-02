//
//  DataCache.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/2.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "DataCache.h"

static YYCache *dataCache;

@implementation DataCache

+ (void)initDataCache{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (dataCache == nil) {
            dataCache = [[YYCache alloc] initWithName:@"dataCache"];
            NSLog(@"dataCache initialized finished");
        }
    });
}

+ (id)getDataWithKey:(NSString *)key{
    if (![dataCache containsObjectForKey:key]) {
        return nil;
    }
    
    id data = [dataCache objectForKey: key];
    return data;
}

+(void)setData:(id)data withKey:(NSString *)key{
    [dataCache setObject:data forKey:key];
}

@end
