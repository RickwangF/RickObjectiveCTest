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
        
        int i, j, k;
        char c, ch;
        float f, fNumber;
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
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
