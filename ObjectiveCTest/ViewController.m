//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
#import "FillRectangleView.h"
#import "StrokeRectangleView.h"
#import "RoundedRectView.h"
#import "OvalView.h"
#import "FullArcView.h"
#import "UIImage+Round.h"
#import "RoundImageView.h"
#import "PolygonView.h"

@interface ViewController ()

@property (nonatomic, assign) CGFloat originX;

@property (nonatomic, assign) CGFloat originY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originX = self.view.frame.size.width / 2 - 200;
    self.originY = self.view.frame.size.height / 2 - 173.2;
    
//    [self initFillRectangleView];
//    [self initStrokeRectangleView];
//    [self initRoundedRectView];
//    [self initOvalView];
//    [self initFullArcView];
//    [self initImageView];
//    [self initRoundImageView];
//    [self initCornerRadiusImageView];
    [self initPolygonView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) initFillRectangleView{
    
    FillRectangleView *rectView = [[FillRectangleView alloc] initWithFrame:CGRectMake(self.originX, self.originY, 100, 100)];
    [self.view addSubview:rectView];
}

-(void) initStrokeRectangleView{
    StrokeRectangleView *strokeView = [[StrokeRectangleView alloc] initWithFrame:CGRectMake(self.originX, self.originY, 100, 100)];
    [self.view addSubview:strokeView];
}

-(void) initRoundedRectView{
    RoundedRectView *roundedView = [[RoundedRectView alloc] initWithFrame:CGRectMake(self.originX, self.originY, 100, 100)];
    [self.view addSubview:roundedView];
}

-(void) initOvalView{
    OvalView *roundedView = [[OvalView alloc] initWithFrame:CGRectMake(self.originX, self.originY, 100, 100)];
    [self.view addSubview:roundedView];
}

-(void) initFullArcView{
    FullArcView *roundedView = [[FullArcView alloc] initWithFrame:CGRectMake(self.originX, self.originY, 100, 100)];
    roundedView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:roundedView];
}

-(void) initImageView{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.originX, self.originY, 200, 200)];
    UIImage *daye = [UIImage imageNamed:@"daye"];
    imageView.image = [UIImage roundImage:daye];
    [self.view addSubview:imageView];
}

-(void) initRoundImageView{
    RoundImageView *roundImageView = [[RoundImageView alloc] initWithFrame:CGRectMake(self.originX, self.originY, 200, 200)];
    [self.view addSubview:roundImageView];
}

-(void) initCornerRadiusImageView{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.originX, self.originY, 200, 200)];
    imageView.image = [[UIImage imageNamed:@"daye"] cornerRadiusImage];
    [self.view addSubview:imageView];
}

-(void) initPolygonView{
    PolygonView *polygonView = [[PolygonView alloc] initWithFrame:CGRectMake(self.originX, self.originY, 400, 346.4)];
    [self.view addSubview:polygonView];
}

@end
