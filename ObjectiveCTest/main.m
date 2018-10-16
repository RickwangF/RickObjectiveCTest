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

// 使用define定义常量，不需要写分号结尾,常量只能在本文件中使用
#define Length 10.5
#define Height 12.0

// extern代表外部变量, 声明一个外部变量，declaration
extern int intVariable;

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        int i;
        char c;
        float f;
        double d;
        NSLog(@"%d", i);
        NSLog(@"%c", c);
        if (c == NULL) {
            NSLog(@"true");
        }
        else{
            NSLog(@"false");
        }
        NSLog(@"%f", f);
        NSLog(@"%f", d);
        NSLog(@"////////////////////separator//////////////////////");
        // 定义一个局部变量， definition
        intVariable = 10;
        NSLog(@"%d", intVariable);
        
        const float length = 10;
        const float height = 12;
        
        NSLog(@"const in main is %f", length * height);
        NSLog(@"const global is %f", Length * Height);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
