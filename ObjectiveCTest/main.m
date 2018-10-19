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
#import "Human.h"
#import "Female.h"
#import "Male.h"

//一个程序的主函数，也是程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
//        NSNumber *num = [[NSNumber alloc] initWithInt:1];
//        NSNumber *copyNum = [num copy];
//
//        NSLog(@"num is %@, copyNum is %@", num, copyNum);
//        NSLog(@"num pointer is %p, copyNum pointer is %p", num, copyNum);
//
//        NSString *nsString = @"rick";
//        NSString *copyString = [nsString copy];
//        NSMutableString *muCopyString = [nsString mutableCopy];
//        NSLog(@"nsString is %@, copyString is %@, muCopyString is %@", nsString, copyString, muCopyString);
//        // %p shows pointer address, &nsString shows heap address
//        NSLog(@"nsString pointer is %p, copyString pointer is %p, muCopyString pointer is %p", nsString, copyString, muCopyString);
//
//        [muCopyString appendString:@"123"];
//        NSLog(@"nsString is %@, copyString is %@, muCopyString is %@", nsString, copyString, muCopyString);
//
//        NSMutableString *muString = [[NSMutableString alloc] initWithString: @"Wang"];
//        NSString *copyMuString = [muString copy];
//        NSMutableString *muCopyMuString = [muString mutableCopy];
//
//        NSLog(@"muString is %@, copyMuString is %@, muCopyMuString is %@", muString, copyMuString, muCopyMuString);
//        NSLog(@"muString pointer is %p, copyMuString pointer is %p, muCopyMuString pointer is %p", muString, copyMuString, muCopyMuString);
//
//        [muString appendString:@"456"];
//        NSLog(@"muString is %@, copyMuString is %@, muCopyMuString is %@", muString, copyMuString, muCopyMuString);
        
        //////////////////////////////////separator/////////////////////////////////////////
        
//        NSArray *array = @[[[NSMutableString alloc] initWithString: @"rick"],[[NSMutableString alloc] initWithString: @"wang"]];
//        NSArray *copyArray = [array copy];
//        NSMutableArray *muCopyArray = [array mutableCopy];
//        NSLog(@"array is %@, copyArray is %@, muCopyArray is %@", array, copyArray, muCopyArray);
//        NSLog(@"array pointer is %p, copyArray pointer is %p, muCopyArray pointer is %p", array, copyArray, muCopyArray);
//
//        NSMutableString *arrMuString = muCopyArray[0];
//        [arrMuString appendString:@"rick"];
//        NSLog(@"after muCopyArray array is %@, copyArray is %@, muCopyArray is %@", array, copyArray, muCopyArray);
//
//        NSMutableString *muMuCopyString = [[muCopyArray objectAtIndex:0] mutableCopy];
//        [muMuCopyString appendString: @"123"];
//        [muCopyArray replaceObjectAtIndex:0 withObject:muMuCopyString];
//        NSLog(@"after muCopyArray array is %@, copyArray is %@, muCopyArray is %@", array, copyArray, muCopyArray);
        
        ////////////////////////////////separator//////////////////////////////////////
        
//        NSMutableArray *muArray = [[NSMutableArray alloc] initWithArray: @[[[NSMutableString alloc] initWithString: @"rick"],[[NSMutableString alloc] initWithString: @"wang"]]];
//        NSArray *muArrayCopy = [muArray copy];
//        NSMutableArray *muArrayMuCopy = [muArray mutableCopy];
//
//        NSLog(@"muArray is %@, muArrayCopy is %@, muArrayMuCopy is %@", muArray, muArrayCopy, muArrayMuCopy);
//        NSLog(@"muArray pointer is %p, muArrayCopy pointer is %p, muArrayMuCopy pointer is %p", muArray, muArrayCopy, muArrayMuCopy);
//
//        NSMutableString *muString = muArray[0];
//        [muString appendString:@"wang"];
//        NSLog(@"muArray is %@, muArrayCopy is %@, muArrayMuCopy is %@", muArray, muArrayCopy, muArrayMuCopy);
//
//        NSMutableArray *muArraryGov = [[NSMutableArray alloc] initWithArray: muArray copyItems:true];
//        NSLog(@"muArray is %@, muArrayGov is %@", muArray, muArraryGov);
//        NSLog(@"muArray pointer is %p, muArrayGov pointer is %p", muArray, muArraryGov);
//
//        for (NSMutableString *string in muArray) {
//            NSLog(@"string from muArray is %p", string);
//        }
//
//        for (NSMutableString *string in muArraryGov) {
//            NSLog(@"string from muArrayGov is %p", string);
//        }
//
//        [muString appendString:@"123123"];
//        NSLog(@"muArray is %@, muArraryGov is %@", muArray, muArraryGov);
        
        ///////////////////////////////separator///////////////////////////////////
//        NSArray *array = @[@"rick",@"wang"];
//        NSArray *copyArray = [[NSArray alloc] initWithArray:array copyItems:true];
//
//        NSLog(@"array is %@, copyArray is %@", array, copyArray);
//        NSLog(@"array pointer is %p, copyArray pointer is %p", array, copyArray);
//
//        for (NSMutableString *string in array) {
//            NSLog(@"string from array is %p", string);
//        }
//
//        for (NSMutableString *string in copyArray) {
//            NSLog(@"string from copyArray is %p", string);
//        }
        
        ///////////////////////////////separaptor//////////////////////////////////
        
        
        Human *human1 = [[Human alloc] init];
        Human *human2 = [human1 copy];
        NSLog(@"human1 is %@, human2 is %@", human1, human2);
        NSLog(@"human1's address is %p, human2's address is %p", human1, human2);
        NSLog(@"human1's name is %p, human2's name is %p", human1.name, human2.name);
        NSLog(@"human1's snacks is %@, human2's snacks is %@", human1.snacks, human2.snacks);
        NSLog(@"human1's snacks's address is %p, human2's snacks's address is %p", human1.snacks, human2.snacks);
        
        NSMutableString *crisp = human1.snacks[0];
        [crisp appendString:@"123"];
        NSLog(@"human1's snacks is %@, human2's snacks is %@", human1.snacks, human2.snacks);
        
        //////////////////////////////separator////////////////////////////////////
        Male *male1 = [[Male alloc] init];
        Male *male2 = [male1 copy];
        NSLog(@"male1 is %@, male2 is %@", male1, male2);
        NSLog(@"male1's sneakers is %@, male2's sneakers is %@", male1.sneakers, male2.sneakers);
        NSLog(@"male1's sneakers address is %p, male2's sneakers address is %p", male1.sneakers, male2.sneakers);
        
        NSMutableString *sneaker = male1.sneakers[0];
        [sneaker appendString: @"one"];
        NSLog(@"male1's sneakers is %@, male2's sneakers is %@", male1.sneakers, male2.sneakers);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
