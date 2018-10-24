//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic) UIImageView* imageView;

-(void) initImageView;

-(void) downloadImage;

-(void) initThread;

-(void) detachNewThread;

-(void) performThread;

-(void) updateImageViewWithImage:(UIImage*)image;

@end

@implementation ViewController

@synthesize imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initImageView];
//    [self initThread];
//    [self detachNewThread];
    [self performThread];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initImageView{
    imageView = [[UIImageView alloc] initWithFrame: CGRectMake(107, 50, 200, 200)];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageView];
}

- (void)downloadImage{
    NSLog(@"current thread is %@", [NSThread currentThread]);
    NSURL *url = [[NSURL alloc] initWithString: @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540275179676&di=9d651a1dd0f63b11bab14d6f5505e7f9&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dpixel_huitu%252C0%252C0%252C294%252C40%2Fsign%3D7e79e0c0dac8a786aa27424e0e71ac51%2F50da81cb39dbb6fd0900a51c0224ab18972b37b4.jpg"];
    NSData *data = [[NSData alloc] initWithContentsOfURL: url];
    UIImage *image = [[UIImage alloc] initWithData: data];
    if (image == nil) {
        NSLog(@"image with data is nil");
    }
    
    [self performSelectorOnMainThread:@selector(updateImageViewWithImage:) withObject:image waitUntilDone:YES];
}

- (void)performThread{
    // 使用performSelector系列方法隐式创建线程并自动启动
    [self performSelectorInBackground:@selector(downloadImage) withObject:nil];
}

- (void)updateImageViewWithImage:(UIImage *)image{
    imageView.image = image;
}

- (void)detachNewThread{
    // 使用detachNewThread 静态方法创建并启动线程
    [NSThread detachNewThreadSelector:@selector(downloadImage) toTarget:self withObject:nil];
}

- (void)initThread{
    // 指定需要在线程中执行的代码并创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector: @selector(downloadImage) object:nil];
    // 设置线程名称
    [thread setName: @"thread1"];
    // 设置线程优先级，0-1，1最高
    [thread setThreadPriority: 1.0];
    // 启动线程
    [thread start];
}



@end
