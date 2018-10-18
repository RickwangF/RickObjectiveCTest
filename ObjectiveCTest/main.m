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
#import "Member.h"

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        Member *member = [[Member alloc] init];
        member.name = @"Rick";
        NSLog(@"member's name is %@", member.name);
        
        member.age = 20;
        NSLog(@"member's age is %d", member.age);
        
        // 判断实例是否是该类的实例，或者是其子类的实例
        BOOL isKind = [member isKindOfClass: [NSObject class]];
        NSLog(@"member isKindOfClass of NSObject %@", isKind ? @"Yes" : @"No");
        
        // 判断实例是否是该类的实例
        BOOL isNSObj = [member isMemberOfClass:[NSObject class]];
        NSLog(@"member isMemberOfClass of NSObject %@", isNSObj ? @"Yes" : @"No");
        
        BOOL isMember = [member isMemberOfClass:[Member class]];
        NSLog(@"member isMemberOfClass of Member %@", isMember ? @"Yes" : @"No");
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
