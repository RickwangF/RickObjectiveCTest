//
//  VariableTest.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 该变量不在任何块或方法中，是全局变量，所有的文件都可以访问它
int intVariable;
// static 修饰的全局变量只能在本文件中进行访问
static long longVariable;

@interface VariableTest : NSObject

+ (void)PrintIntVariable;

@end

NS_ASSUME_NONNULL_END
