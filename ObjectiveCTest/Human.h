//
//  Human.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/18.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Human : NSObject <NSCopying>

@property (nonatomic, strong) NSMutableString *name;
@property (nonatomic, assign) double height;
@property (nonatomic, assign) double weight;

@property (nonatomic, strong) NSMutableArray *snacks;

- (instancetype)init;

- (void) laugh;

@end

NS_ASSUME_NONNULL_END