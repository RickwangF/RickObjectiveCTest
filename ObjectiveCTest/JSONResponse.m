//
//  JSONResponse.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/27.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "JSONResponse.h"

#import <YYModel/YYModel.h>

static Class dataClass;

static NSArray *classArr;

@implementation JSONResponse

+ (instancetype)init
{
    JSONResponse *resp = [[super alloc] init];
    if (resp) {
        resp.Code = 0;
        resp.Data = nil;
        resp.Msg = nil;
    }
    return resp;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.Code = 0;
        self.Data = nil;
        self.Msg = nil;
    }
    return self;
}

// dataClass在外部访问不到，但是在.m文件中是全局对象
+ (void)setDataClass:(Class)class{
    if (dataClass){
        dataClass = nil;
    }
    dataClass = class;
}

+ (void)setDataClassArr:(NSArray *)array{
    if (classArr){
        classArr = nil;
    }
    classArr = array;
}

// 当JSON转为Model完成后，该方法会被调用,转化后需将常量置空
- (BOOL) modelCustomTransformFromDictionary:(NSDictionary *)dic{
    if (dataClass){
        _Data = [[dataClass class] yy_modelWithJSON:[dic valueForKey:@"Data"]];
        dataClass = nil;
    }
    if (classArr){
        NSMutableArray *array = [NSMutableArray array];
        NSArray *itemArray = [dic valueForKey:@"Data"];
        if (classArr.count == 1){
            for(int i = 0;i<itemArray.count;i++){
                [array addObject:[(Class)classArr.firstObject yy_modelWithJSON:itemArray[i]]];
            }
        }
        else{
            for(int i = 0;i<itemArray.count;i++){
                [array addObject:[(Class)classArr[i] yy_modelWithJSON:itemArray[i]]];
            }
        }
        _Data = array;
        classArr = nil;
    }
    return YES;
}


@end
