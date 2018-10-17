//
//  Member.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/17.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 在NS_ASSUME_NONNULL_BEGIN 中默认所有的成员都是NONNULL，
 如果有成员是NULL则需要单独指出
*/
NS_ASSUME_NONNULL_BEGIN

@interface Member : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) int age;

- (instancetype)init;

// 成员变量的读取方法
- (NSString*) getMemberName;

// 成员变量的设置方法
- (void) setMemberName:(NSString*)name;

- (int) getMemberAge;

- (void) setMemberAge:(int)age;

@end

NS_ASSUME_NONNULL_END
