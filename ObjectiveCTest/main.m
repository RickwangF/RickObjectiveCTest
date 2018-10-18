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

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        int (^myBlock) (int) = ^(int number){
            return number * number;
        };
        NSLog(@"call myBlock's result is %d", myBlock(10));
        
        
        __block NSString *string = @"Rick";
        NSLog(@"string is %@", string);

        // 捕获外部变量string
        void(^block) (void) = ^() {
            NSLog(@"string is %@, from block", string);
        };

        string = @"Smith";
        NSLog(@"string is %@", string);
        block();
        
        // NSConcreteGlobalBlock
        ^{NSLog(@"hello world");}();
        
        // NSConcreteStackBlock
        int a = 1;
        ^{NSLog(@"print a is %d", a);}();
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
