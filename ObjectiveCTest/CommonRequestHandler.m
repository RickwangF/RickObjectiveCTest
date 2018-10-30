//
//  CommonRequestHandler.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/29.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#define BASE_URL @"https://exam.zfgo360.com"

#import "CommonRequestHandler.h"

static AFHTTPSessionManager* httpManager;

@implementation CommonRequestHandler

+ (void)initializeHttpManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (httpManager == nil) {
            NSURL *url = [NSURL URLWithString: BASE_URL];
            httpManager = [[AFHTTPSessionManager alloc] initWithBaseURL: url];
            httpManager.requestSerializer.timeoutInterval = 10.0;
            httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:  @"application/json", @"text/html", @"text/xml", @"text/plain", @"application/xml", nil];
        }
    });
}

+ (void)resetHttpManager{
    NSURL *url = [NSURL URLWithString: BASE_URL];
    httpManager = [[AFHTTPSessionManager alloc] initWithBaseURL: url];
    httpManager.requestSerializer.timeoutInterval = 10.0;
    httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:  @"application/json", @"text/html", @"text/xml", @"text/plain", @"application/xml", nil];
}

+ (void)setAuthorization:(NSString *)auth withToken:(NSString *)token andUDID:(NSString *)udid{
    if (httpManager == nil) {
        return;
    }
    
    [httpManager.requestSerializer setValue:auth forHTTPHeaderField: @"Authorization"];
    [httpManager.requestSerializer setValue:token forHTTPHeaderField: @"token"];
    [httpManager.requestSerializer setValue:udid forHTTPHeaderField: @"udid"];
}

+(void)get:(NSString *)url withParams:(id)parameters success:(void (^)(id _Nullable))success failure:(void (^)(NSString * _Nonnull))failure{
    [httpManager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject == nil ) {
            failure(@"请求出错，没有返回任何数据");
            return;
        }
        
        NSNumber *code = [responseObject objectForKey: @"Code"];
        if (code > 0) {
            NSString *msg = [responseObject objectForKey: @"Msg"];
            if (msg != nil) {
                failure([NSString stringWithFormat: @"请求错误，%@", msg]);
            }
            else{
                failure(@"请求出错，未知的错误原因");
            }
            return;
        }
        
        success([responseObject objectForKey: @"Data"]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error.domain) {
            NSLog(@"request error domain is %@", error.domain);
        }
        
        if (error.code > 0){
            NSLog(@"request error code is %ld", (long)error.code);
        }
        
        failure(error.localizedDescription);
    }];
}

+(void)post:(NSString *)url withParams:(id)parameters success:(void (^)(id _Nullable))success failure:(void (^)(NSString * _Nonnull))failure{
    [httpManager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject == nil ) {
            failure(@"请求出错，没有返回任何数据");
            return;
        }
        
        NSNumber *code = [responseObject objectForKey: @"Code"];
        if (code > 0) {
            NSString *msg = [responseObject objectForKey: @"Msg"];
            if (msg != nil) {
                failure([NSString stringWithFormat: @"请求错误，%@", msg]);
            }
            else{
                failure(@"请求出错，未知的错误原因");
            }
            return;
        }
        
        success([responseObject objectForKey: @"Data"]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error.domain) {
            NSLog(@"request error domain is %@", error.domain);
        }
        
        if (error.code > 0){
            NSLog(@"request error code is %ld", (long)error.code);
        }
        
        failure(error.localizedDescription);
        
    }];
}

@end