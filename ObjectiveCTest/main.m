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
#import "UserModel.h"
// 如果不import该分类，则printUserAvailable方法找不到
#import "UserModel+Other.h"

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        UserModel *user = [[UserModel alloc] init];
        [user printLoginName];
        // 来自UserModel+Other分类中定义的方法
        [user printUserAvailable];
        // user.realName = @"Rick who"; 不能直接使用这样的语法修改扩展中定义的属性
        // 来自UserModel+Info扩展中定义的方法
        [user printRealName];
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
