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

@property (nonatomic) NSString *AreaCode;
@property (nonatomic, assign) double AvailableDeposit;
@property (nonatomic) NSString *AvatarUrl;
@property (nonatomic) NSString *BirthDay;
@property (nonatomic, assign) BOOL DestSelected;
@property (nonatomic) NSString *Email;
@property (nonatomic,assign) BOOL EmailBind;
@property (nonatomic) NSString *Gender;
@property (nonatomic, assign) int Id;
@property (nonatomic) NSString *LoginName;
@property (nonatomic) NSString *Phone;
@property (nonatomic, nullable) NSString* QQ;
@property (nonatomic) NSString *RealName;
@property (nonatomic, nullable) NSString *UDID;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
