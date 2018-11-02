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
@property (nonatomic, nullable, copy) NSString *AvatarUrl;
@property (nonatomic, nullable, copy) NSString *Description;
@property (nonatomic, assign) int Id;
@property (nonatomic, assign) int LearnStatus;
@property (nonatomic, assign) int LessonNum;
@property (nonatomic, nullable, copy) NSString *LogoUrl;
@property (nonatomic, assign) int MemberCount;
@property (nonatomic, assign) double Price;
@property (nonatomic, nullable, copy) NSString *SubTitle;
@property (nonatomic, nullable, copy) NSString *Summary;
@property (nonatomic, nullable, copy) NSString *Tags;
@property (nonatomic, nullable, copy) NSString *TeacherName;
@property (nonatomic, nullable, copy) NSString *Title;
@property (nonatomic, nullable, copy) NSString *UseValidEndDate;
@property (nonatomic, nullable, copy) NSString *ValidEndDate;

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
