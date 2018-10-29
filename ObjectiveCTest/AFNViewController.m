//
//  AFNViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/27.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "AFNViewController.h"
#import "LoginModel.h"
#import "JSONResponse.h"
#import "LoginResult.h"
#import "MoocModel.h"
#import <AFNetworking/AFNetworking.h>
static AFHTTPSessionManager* httpManager = nil;

@interface AFNViewController ()

-(void) initManager;

-(void) initManagerWithConfig;

-(void) loginRequest;

-(void) basicRequest;

@end

@implementation AFNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initManagerWithConfig];
    [self loginRequest];
//    [self basicRequest];
    // Do any additional setup after loading the view.
}

-(void)initManager{
    
}

-(void)initManagerWithConfig{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 5.0;
    config.allowsCellularAccess = YES;
    
    NSURL *url = [NSURL URLWithString: @"https://exam.zfgo360.com"];
    httpManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url sessionConfiguration:config];
    httpManager.requestSerializer.timeoutInterval = 10.0;
    httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:  @"application/json", @"text/html", @"text/xml", @"text/plain", @"application/xml", nil];
    
}

-(void)loginRequest{
    LoginModel *loginModel = [[LoginModel alloc]init];
    loginModel.LoginName = @"18687103500";
    loginModel.Password = @"123456";
    loginModel.Client = @"iOS";
    loginModel.UDID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    [httpManager POST:@"/AppV2/Authenticate/Login" parameters:[loginModel toDictionary] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject != nil) {
            NSLog(@"responseObject is %@", responseObject);
            [JSONResponse setDataClass:[LoginResult class]];
            JSONResponse<LoginResult*> *responseData = [JSONResponse<LoginResult*> yy_modelWithJSON:responseObject];
            if (responseData != nil) {
                LoginResult *result = responseData.Data;
                [httpManager.requestSerializer setValue:result.Token forHTTPHeaderField:@"token"];
                [httpManager.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@", result.Token] forHTTPHeaderField: @"Authorization"];
                [httpManager.requestSerializer setValue:loginModel.UDID forHTTPHeaderField:@"udid"];
                [self basicRequest];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error != nil) {
            NSLog(@"login request error is %@", [error localizedDescription]);
        }
    }];
}

-(void)basicRequest{
    NSDictionary *requestDic = [NSDictionary dictionaryWithObjectsAndKeys:@6,@"top", nil];
    [httpManager GET:@"/appv2/mooc/RcmdMoocList" parameters:requestDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject != nil) {
            NSLog(@"responseObject is %@", responseObject);
            [JSONResponse setDataClassArr: [NSArray arrayWithObjects:[MoocModel class], nil]];
            JSONResponse<MoocModel*> *responseData = [JSONResponse<MoocModel*> yy_modelWithJSON:responseObject];
            if (responseData != nil) {
                NSArray<MoocModel*> *array = responseData.Data;
                if (array == nil || array.count == 0) {
                    NSLog(@"yy_modelWithJson failed");
                }
            }
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error != nil) {
            NSLog(@"basic request error is %@", [error localizedDescription]);
        }
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
