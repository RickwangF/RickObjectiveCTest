//
//  main.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

// #import是预处理命令，告诉编译器在编译之前需要引入以下的头文件
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "LoginInfo.h"

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        LoginInfo *loginInfo = [LoginInfo getSharedInstance];
        NSString *udidString = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        NSString *tokenString = @"askdjakjh12312n1d1231iwdnakjs";
        [LoginInfo setUdidWithString: udidString];
        [LoginInfo setTokenKeyWithString:tokenString];
        NSLog(@"loginInfo is %@ from main.m", loginInfo);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
