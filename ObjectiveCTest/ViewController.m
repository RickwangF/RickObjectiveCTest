//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
#import "LoginModel.h"

static NSString* udid;
static NSString* token;

@interface ViewController ()
    
-(void)createNSURLSession;
    
-(void)createNSURLSessionWithConfig;
    
-(void)createNSURLSessionWithDelegateAndConfig;
    
-(void)requestGet;
    
-(void)requestPost;
    
-(void)uploadAvatar;

-(void)downloadRAR;

@end

@implementation ViewController
    
NSURLSession *urlSession;
NSURLSession *sessionConfiged;
NSURLSession *sessionDelegated;

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self createNSURLSession];
//    [self requestGet];
    [self createNSURLSessionWithConfig];
    [self downloadRAR];
//    [self requestPost];
    // Do any additional setup after loading the view, typically from a nib.
}

// 使用sharedSession方法创建
- (void)createNSURLSession{
    urlSession = [NSURLSession sharedSession];
}

// 使用sessionWithConfiguration方法创建
- (void)createNSURLSessionWithConfig{
    sessionConfiged = [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration defaultSessionConfiguration]];
}

// 使用sessionWithConfiguration delegate方法创建
// urlsession的delegate是只读属性，想要设置只能用下面的方法
- (void)createNSURLSessionWithDelegateAndConfig{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionDelegated = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
}

// 使用urlSession进行Get请求
-(void)requestGet{
    NSURL *url = [[NSURL alloc] initWithString:@"https://www.sojson.com/api/qqmusic/8446666"];
    
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
        
        if (data != nil) {
            NSLog(@"%@", [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding]);
        }
    }];
    
    [dataTask resume];
}

// 使用urlSession进行Post请求
-(void)requestPost{
    LoginModel *loginModel = [[LoginModel alloc] init];
    loginModel.LoginName = @"18687103500";
    loginModel.Password = @"123456";
    loginModel.UDID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    loginModel.Client = @"iOS";
    
    if (udid == nil) {
        udid = loginModel.UDID;
    }
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://exam.zfgo360.com/AppV2/Authenticate/Login"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    // Content-Type和Accept必须要设置，Accept告诉服务器客户端可以接受什么类型的内容
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSError *err = nil;
    [request setHTTPBody: [NSJSONSerialization dataWithJSONObject:[loginModel toDictionary] options:NSJSONWritingPrettyPrinted error:&err]];
    NSURLSessionDataTask *dataTask = [sessionConfiged dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
        
        if (data != nil) {
            NSLog(@"%@", [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding]);
            NSError *err;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
            if ([dic objectForKey:@"Data"] != nil) {
                NSDictionary *dataDic = [dic objectForKey: @"Data"];
                if (token == nil) {
                    token = [dataDic objectForKey:@"Token"];
                    NSLog(@"token is %@", token);
                }
                [self uploadAvatar];
            }
            
        }
    }];
    
    [dataTask resume];
}
    
-(void) uploadAvatar{
    NSURL* url = [NSURL URLWithString:@"https://exam.zfgo360.com/AppV2/Account/SaveAvatar"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url];
    request.HTTPMethod = @"POST";
    [request addValue:token forHTTPHeaderField: @"token"];
    [request addValue:udid forHTTPHeaderField: @"udid"];
    NSString *auth = [NSString stringWithFormat:@"Basic %@", token];
    [request addValue: auth forHTTPHeaderField: @"Authorization"];
    [request addValue:@"multipart/form-data; boundary=unique-constant-string" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    UIImage *image = [UIImage imageNamed: @"daye.jpg"];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    NSURLSessionUploadTask *uploadTask = [sessionConfiged uploadTaskWithRequest:request fromData:imageData completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
        
        if (data != nil) {
            NSLog(@"%@", [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding]);
        }
    }];
    
    [uploadTask resume];
}

- (void)downloadRAR{
    NSString *urlString = @"http://wd.jb51.net:81/201608/books/EffectiveObjective-C2_jb51.rar";
    NSURL *url = [NSURL URLWithString: urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // location的位置是/tmp，临时文件夹，下载完成之后需要复制到指定的文件夹
    NSURLSessionDownloadTask *downloadTask = [sessionConfiged downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
        
        NSString *filePath = @"/Users/rickwang/Desktop/123.rar";
        NSError *fileError = nil;
        [[NSFileManager defaultManager] copyItemAtPath:location.path toPath:filePath error:&fileError];
        if (fileError != nil) {
            NSLog(@"file copy fail with error is %@", fileError.localizedDescription);
        }
        else{
            NSLog(@"file copy success");
        }
    }];
    
    [downloadTask resume];
}
    
@end
