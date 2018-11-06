//
//  PMSpeaker.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/6.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "Person.h"
#import "ProgrammerCoder.h"
#import "ProductManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface PMSpeaker : Person<ProductManager>

@property (nonatomic, weak) id<Programmer> delegate;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
