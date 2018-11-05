//
//  TestObject.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/2.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestObject : NSObject

@property (nonatomic, copy) NSString *LoginName;
@property (nonatomic, assign) BOOL Available;
@property (nonatomic) void(^block)(void);

-(instancetype)init;

-(void) printLoginName;

-(BOOL) testBlock;

-(void) testReturnWithBlock:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
