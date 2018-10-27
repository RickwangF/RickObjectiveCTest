//
//  JSONResponse.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/27.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSONResponse<T> : NSObject

# pragma mark - property
@property (nonatomic, assign) int Code;
@property (nonatomic, nullable) T Data;
@property (nonatomic, copy, nullable) NSString *Msg;

# pragma mark - method
+ (instancetype) init;

+ (void)setDataClass:(Class) class;

+ (void)setDataClassArr:(NSArray *)array;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
