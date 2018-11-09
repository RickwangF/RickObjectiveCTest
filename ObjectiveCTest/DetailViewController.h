//
//  DetailViewController.h
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/11/8.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunicateDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (nonatomic, weak) id<CommunicateDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
