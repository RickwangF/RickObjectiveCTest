//
//  ProductManager.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/6.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ProductManager <NSObject>

-(void) planToDo;

-(void) watchToDo;

@optional -(void) backToHome;

@end

NS_ASSUME_NONNULL_END
