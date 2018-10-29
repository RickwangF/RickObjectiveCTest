//
//  MoocModel.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoocModel : NSObject

@property (nonatomic, assign) int Available;
@property (nonatomic, nullable) NSString *AvatarUrl;
@property (nonatomic, nullable) NSString *Description;
@property (nonatomic, assign) int Id;
@property (nonatomic, assign) int LearnStatus;
@property (nonatomic, assign) int LessonNum;
@property (nonatomic, nullable) NSString *LogoUrl;
@property (nonatomic, assign) int MemberCount;
@property (nonatomic, assign) double Price;
@property (nonatomic, nullable) NSString *SubTitle;
@property (nonatomic, nullable) NSString *Summary;
@property (nonatomic, nullable) NSString *Tags;
@property (nonatomic, nullable) NSString *TeacherName;
@property (nonatomic, nullable) NSString *Title;
@property (nonatomic, nullable) NSString *UseValidEndDate;
@property (nonatomic, nullable) NSString *ValidEndDate;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
