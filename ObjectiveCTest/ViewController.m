//
//  ViewController.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/16.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"

@interface ViewController ()

@property (nonatomic, strong) UserModel *userModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserModel *model = [[UserModel alloc] init];
    model.UserName = @"Wang";
    self.userModel = model;
    [self.userModel PrintUserName];
    
//    [self.userModel PrintUserName];
    // Do any additional setup after loading the view, typically from a nib.
}


// Lazy init
-(UserModel*)userModel{
    if (_userModel == nil){
        _userModel = [[UserModel alloc] init];
    }
    return _userModel;
}

-(void)setUserModel:(UserModel *)userModel{
    if (![_userModel isEqual:userModel]) {
        _userModel = userModel;
    }
}

@end
