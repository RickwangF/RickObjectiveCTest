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
#import <CoreLocation/CoreLocation.h>

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        CLLocationCoordinate2D coordinates[10];
        
        CLLocationCoordinate2D coor[10] = {0};
        NSLog(@"coor[0] latitude is %f and longtitude is %f", coor[0].latitude, coor[0].longitude);
        
        int count = 10;
        CLLocationCoordinate2D array[count];
        
        array[0].latitude = 121.0;
        array[0].longitude = 122.0;
        NSLog(@"array[0] latitude is %f and longtitude is %f", array[0].latitude, array[0].longitude);
        
//        NSArray<User*> *array = @[[[User alloc] init], [[User alloc] init]];
//        for (User* user in array) {
//            NSLog(@"foreach user's name is %@", user.UserName);
//        }
//
//        NSArray<User*> *userArray = [NSArray arrayWithObjects: [[User alloc] init], [[User alloc] init], [[User alloc] init], nil];
//        for (User* user in userArray) {
//            user.UserAge += 1;
//            NSLog(@"foreach user's age is %d", user.UserAge);
//        }
//
//        NSArray *genericArray = [NSArray arrayWithArray: array];
//        for (User* user in genericArray) {
//            NSLog(@"foreach user's age is %d", user.UserAge);
//        }
//
//        NSString *name = [array objectAtIndex:0].UserName;
//        NSLog(@"foreach name's age is %@", name);
//
//        // 定义数字型数组,不能使用基本的值类型
//        NSArray<NSNumber*> *intArray = @[@123, @12345];
//
//        NSArray *numArray = @[@123.4, @1234];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
