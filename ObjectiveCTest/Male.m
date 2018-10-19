//
//  male.m
//  ObjectiveCTest
//
//  Created by Rick Wang on 2018/10/18.
//  Copyright © 2018 KMZJ. All rights reserved.
//

#import "Male.h"

@implementation Male

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sneakers = [[NSMutableArray alloc] initWithObjects:[[NSMutableString alloc] initWithString: @"air jordan"], nil];
    }
    return self;
}

- (void)laugh{
    if (self.sneakers != nil && self.sneakers.count > 0) {
        NSLog(@"哈哈哈哈");
    }
    else{
        [super laugh];
    }
}

-(id)copyWithZone:(NSZone *)zone{
    Male* copy = [super copyWithZone:zone];
    NSMutableArray *sneakerArray = [[NSMutableArray alloc] init];
    for (NSString *string in self.sneakers) {
        NSMutableString *sneakerString = [[NSMutableString alloc] initWithString:string];
        [sneakerArray addObject:sneakerString];
    }
    copy.sneakers = sneakerArray;
    return copy;
}

@end
