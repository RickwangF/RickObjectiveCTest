//
//  LoginModel.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/26.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginModel : NSObject
    
@property (nonatomic) NSString *LoginName;
@property (nonatomic) NSString *Password;
@property (nonatomic) NSString *Client;
@property (nonatomic) NSString *UDID;
    
-(instancetype)init;
    
-(NSDictionary*)toDictionary;

@end

NS_ASSUME_NONNULL_END
