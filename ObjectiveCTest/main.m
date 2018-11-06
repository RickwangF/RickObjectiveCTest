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
#import "ProgrammerCoder.h"
#import "PMSpeaker.h"

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        ProgrammerCoder *programmer = [[ProgrammerCoder alloc] init];
        PMSpeaker *productManager = [[PMSpeaker alloc] init];
        
        programmer.delegate = productManager;
        productManager.delegate = programmer;
        
        ///////////////////////A project beginning////////////////////////
        
        [productManager planToDo];
        // when pm finished project requirement work, he told his delegate go to work
        [productManager.delegate doWork];
        // when coder finished his work, he told his delegate to wathc his work today
        [programmer.delegate watchToDo];
        // when pm watch coder's work, coder get rest
        [programmer getRest];
        // pm finished checking coder's work, he would go back home
        [productManager backToHome];
        // coder would go home
        [programmer getHome];
        
        /////////////////////////Project finished/////////////////////////
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
