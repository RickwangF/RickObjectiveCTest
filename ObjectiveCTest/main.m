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

void exampleB_addBlockToArray(NSMutableArray *array) {
    char b = 'B';
    [array addObject:^{
        printf("%c\n", b);
    }];
}

void exampleB() {
    NSMutableArray *array = [NSMutableArray array];
    exampleB_addBlockToArray(array);
    // NSConcreteMallocBlock
    void (^block)() = [array objectAtIndex:0];
    block();
}

// 全局变量
int global_int = 1;

// 全局静态变量
static int static_global_int = 2;

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // 局部静态变量
        static int static_partial_int = 3;
        
        // 局部变量（自动变量）
        int partial_int = 4;
        
        __block int __block_partial_int = 5;
        
        // 以上定义的全局变量，全局静态变量，局部静态变量都可以直接在block中使用，并改变它们的值
        void (^block)(void) = ^(){
            __block_partial_int = 55;
            // partial_int = 44; 不能在block中修改外部局部变量的值，除非加上__block修饰
            static_partial_int = 33;
            static_global_int = 22;
            global_int = 11;
        };
        
        block();
        
        NSLog(@"global_int is %d", global_int);
        NSLog(@"static_global_int is %d", static_global_int);
        NSLog(@"static_partial_int is %d", static_partial_int);
        NSLog(@"partial_int is %d", partial_int);
        NSLog(@"__block_partial_int is %d", __block_partial_int);
        
//        int (^myBlock) (int) = ^(int number){
//            return number * number;
//        };
//        NSLog(@"call myBlock's result is %d", myBlock(10));
//
//
//        __block NSString *string = @"Rick";
//        NSLog(@"string is %@", string);
//
//        // 捕获外部变量string
//        void(^block) (void) = ^() {
//            NSLog(@"string is %@, from block", string);
//        };
//
//        string = @"Smith";
//        NSLog(@"string is %@", string);
//        block();
//
//        // NSConcreteGlobalBlock
//        ^{NSLog(@"hello world");}();
//
//        // NSConcreteStackBlock
//        int a = 1;
//        ^{NSLog(@"print a is %d", a);}();
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
