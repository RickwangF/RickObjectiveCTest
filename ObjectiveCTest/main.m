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

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        // For 循环
        for (int a = 0; a < 10; a ++) {
            NSLog(@"now a is %d", a);
        }
        
        // While 循环
        
        int a = 12;
        while (a > 0) {
            NSLog(@"now a in while loop is %d", a);
            a--;
        }
        
        // Do While 循环,起码要执行一次
        int b = 0;
        do {
            NSLog(@"now, b is %d", b);
        } while(b > 0);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
