//
//  TransmitViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/6.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "TransmitViewController.h"
#import <objc/runtime.h>
#import "People.h"

@interface TransmitViewController ()

@end

@implementation TransmitViewController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    return [super initWithCoder:aDecoder];
}

-(void)loadView{
    UIView *mainView = [[UIView alloc] initWithFrame: UIScreen.mainScreen.bounds];
    mainView.backgroundColor = [UIColor greenColor];
    mainView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view = mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(foo)];
    // Do any additional setup after loading the view.
}

// 不解析实例的方法
+(BOOL)resolveInstanceMethod:(SEL)sel{
    return NO;
}


// 没有目标对象可以响应消息
- (id)forwardingTargetForSelector:(SEL)aSelector{
    return nil;
}

// 进入完整的消息转发i流程，根据SEL寻找有没有合适的函数签名，有的话进行签名，进入forwardInvocation
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"foo"]) {
        return [NSMethodSignature signatureWithObjCTypes: "v@:"];// v@:,v 代表void是返回值，@代表object，：代表SEL选择器， 进行签名,runtime 生成了一个anInvocation对象发送给forwardInvocation
    }
    /*
        types An array of characters that describe the types of the arguments to the method.
     *  Since the function must take at least two arguments—self and _cmd, the second and third characters
     *  must be “@:” (the first character is the return type).
        https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100-SW1
     */
    return [super methodSignatureForSelector:aSelector];
}

// anInvocation包含了转发消息相关消息，函数的参数，返回值等
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL sel = anInvocation.selector;
    
    People *people = [[People alloc] init];
    if ([people respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:people];
    }
    else {
        [self doesNotRecognizeSelector:sel];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
