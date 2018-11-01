//
//  CommonRequestViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/30.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "CommonRequestViewController.h"
#import "CommonRequestHandler.h"
#import <YYModel/YYModel.h>
#import <Masonry/Masonry.h>
#import "MoocModel.h"
#import "LoginModel.h"
#import "LoginResult.h"

@interface CommonRequestViewController ()

@property (nonatomic) UIButton *loginBtn;
@property (nonatomic) UIButton *resetBtn;
@property (nonatomic) UIButton *requestBtn;
@property (nonatomic) UIButton *uploadBtn;
@property (nonatomic) UIButton *tokenBtn;
@property (nonatomic) NSMutableArray *moocArray;

-(void) login;

-(void) moocList;

-(void) editRealName;

-(void) printMoocArray;

-(void) initBtns;

-(void) resetHttpManager;

-(void) uploadAvatar;

-(void) displayToken;

@end

@implementation CommonRequestViewController

NSString *token = @"";

@synthesize moocArray, loginBtn, resetBtn, requestBtn, uploadBtn, tokenBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    [CommonRequestHandler initializeHttpManager];
    NSLog(@"httpManager initialize finished");
    moocArray = [[NSMutableArray alloc] init];
    [self initBtns];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)initBtns{
    
    loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    resetBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [resetBtn setTitle:@"重置" forState:UIControlStateNormal];
    [resetBtn setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
    [resetBtn addTarget:self action:@selector(resetHttpManager) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:resetBtn];
    
    requestBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [requestBtn setTitle:@"请求" forState:UIControlStateNormal];
    [requestBtn setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
    [requestBtn addTarget:self action:@selector(editRealName) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:requestBtn];
    
    uploadBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [uploadBtn setTitle:@"上传" forState:UIControlStateNormal];
    [uploadBtn setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
    [uploadBtn addTarget:self action:@selector(uploadAvatar) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:uploadBtn];
    
    tokenBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [tokenBtn setTitle:@"显示Token" forState:UIControlStateNormal];
    [tokenBtn setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
    [tokenBtn addTarget:self action:@selector(displayToken) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:tokenBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@35);
    }];
    
    [resetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginBtn.mas_bottom).offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@35);
    }];
    
    [requestBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.resetBtn.mas_bottom).offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@35);
    }];
    
    [uploadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.requestBtn.mas_bottom).offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@35);
    }];
    
    [tokenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.uploadBtn.mas_bottom).offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@35);
    }];
}

- (void)login{
    LoginModel *loginModel = [[LoginModel alloc] init];
    loginModel.LoginName = @"18687103500";
    loginModel.Password = @"123456";
    loginModel.Client = @"iOS";
    loginModel.UDID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    [CommonRequestHandler post:@"/AppV2/Authenticate/Login" withParams:[loginModel yy_modelToJSONObject] success:^(id  _Nullable responseObject) {
        
        if (responseObject == nil) {
            NSLog(@"responseObj is nil");
            return;
        }
        
        LoginResult *result = [LoginResult yy_modelWithJSON:responseObject];
        token = result.Token;
        NSString *token = result.Token;
        NSString *uuid = loginModel.UDID;
        NSString *auth = [NSString stringWithFormat:@"Basic %@", token];
        [CommonRequestHandler setAuthorization:auth withToken:token andUDID:uuid];
        NSLog(@"login success");
        
    } failure:^(NSString * _Nonnull error) {
        NSLog(@"login request fail with a error, %@", error);
    }];
}

- (void)moocList{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@1, @"page", @20, @"pageSize", nil];
    [CommonRequestHandler get:@"/app/v2/mooc/moocList" withParams:params success:^(id  _Nullable responseObject) {
        
        if (responseObject == nil) {
            NSLog(@"responseObject is nil");
            return;
        }
        
        for (id item in responseObject) {
            MoocModel *mooc = [MoocModel yy_modelWithJSON: item];
            [self.moocArray addObject:mooc];
        }
        
        [self printMoocArray];
        
    } failure:^(NSString * _Nonnull error) {
        NSLog(@"get request fail with a error, %@", error);
    }];
}

-(void)editRealName{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:token, @"token", @"Rick", @"realName",nil];
    [CommonRequestHandler post:@"/AppV2/Account/EditRealName" withParams:params success:^(id  _Nullable responseObject) {
        
        NSLog(@"eidt realName success");
        
    } failure:^(NSString * _Nonnull error) {
        NSLog(@"edit realName request fail with a error, %@", error);
    }];
}

- (void)uploadAvatar{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:token, @"token", nil];
    [CommonRequestHandler upload:@"/AppV2/Account/SaveAvatar" withParams: params bodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        UIImage *image = [UIImage imageNamed:@"daye.jpg"];
        NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
        [formData appendPartWithFileData:imageData name:@"fileAvatar" fileName:@"daye.jpg" mimeType:@"image/jpeg"];
        
    } success:^(id  _Nullable responseObject) {
        
        if (responseObject != nil) {
            NSLog(@"upload avatar success with %@", responseObject);
        }
        
    } failure:^(NSString * _Nonnull error) {
        NSLog(@"upload avatar request fail with a error, %@", error);
    }];
}

- (void)printMoocArray{
    NSLog(@"moocArray is %@", moocArray);
}

-(void)resetHttpManager{
    token = @"";
    [CommonRequestHandler resetHttpManager];
    NSLog(@"reset success");
}

-(void)displayToken{
    NSLog(@"token is %@ now", token);
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
