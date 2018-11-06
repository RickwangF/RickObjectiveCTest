//
//  Person.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/6.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(foo:)) { // 如果执行的是foo函数，就动态解析，增加新的IMP
        class_addMethod([self class], sel, (IMP)fooMethod, "v@:");
        return YES;
    }
    /*
     types An array of characters that describe the types of the arguments to the method.
     *  Since the function must take at least two arguments—self and _cmd, the second and third characters
     *  must be “@:” (the first character is the return type).
        https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100-SW1
     */
    return [super resolveInstanceMethod:sel];
}


void fooMethod(id obj, SEL _cmd) {
    NSLog(@"Doing foo");
}

@end
