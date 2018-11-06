//
//  UserModel+Other.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/5.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

// 该分类是UserModel类的一个叫Other的分类，
// 它定义了一个属性realName和printUserAvailable方法
@interface UserModel (Other)

-(void) printUserAvailable;

@end

NS_ASSUME_NONNULL_END
