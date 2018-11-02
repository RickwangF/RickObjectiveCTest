//
//  UserModel.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

@property (nonatomic, copy) NSString *AreaCode;
@property (nonatomic, assign) double AvailableDeposit;
@property (nonatomic, copy) NSString *AvatarUrl;
@property (nonatomic, copy) NSString *BirthDay;
@property (nonatomic, assign) BOOL DestSelected;
@property (nonatomic, copy) NSString *Email;
@property (nonatomic,assign) BOOL EmailBind;
@property (nonatomic, copy) NSString *Gender;
@property (nonatomic, assign) int Id;
@property (nonatomic, copy) NSString *LoginName;
@property (nonatomic, copy) NSString *Phone;
@property (nonatomic, nullable, copy) NSString* QQ;
@property (nonatomic, copy) NSString *RealName;
@property (nonatomic, nullable, copy) NSString *UDID;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
