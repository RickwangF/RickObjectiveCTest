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
#import "User.h"

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSArray<User*> *array = @[[[User alloc] init], [[User alloc] init]];
        for (User* user in array) {
            NSLog(@"foreach user's name is %@", user.UserName);
        }
        
        NSArray<User*> *userArray = [NSArray arrayWithObjects: [[User alloc] init], [[User alloc] init], [[User alloc] init], nil];
        for (User* user in userArray) {
            user.UserAge += 1;
            NSLog(@"foreach user's age is %d", user.UserAge);
        }
        
        NSArray *genericArray = [NSArray arrayWithArray: array];
        for (User* user in genericArray) {
            NSLog(@"foreach user's age is %d", user.UserAge);
        }
        
        NSString *name = [array objectAtIndex:0].UserName;
        NSLog(@"foreach name's age is %@", name);
        
        // 定义数字型数组,不能使用基本的值类型
        NSArray<NSNumber*> *intArray = @[@123, @12345];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
