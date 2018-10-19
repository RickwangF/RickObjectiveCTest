//
//  Female.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/18.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "Human.h"

NS_ASSUME_NONNULL_BEGIN

@interface Female : Human

@property (nonatomic, strong) NSMutableArray* bags;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
