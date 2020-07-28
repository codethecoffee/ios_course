//
//  ViewController.m
//  Numbers
//
//  Created by Suzy Lee on 7/28/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Native C types are available in Objective-C, because Obj-C is a superset of C
    int myInt = 5;
    float myFloat = 3.3;
    double myDouble = 5.3920;
    
    NSLog(@"Int: %d", myInt);
    NSLog(@"Float: %f", myFloat);
    NSLog(@"Double: %f", myDouble);
    
    // The line below throws the error: "Collection element of type 'int' is not an
    // Objective-C object." We can't even populate an Obj-C array with native C types!
    // NSArray *arr = @[myInt, myFloat, myDouble];
    
    // We should use NSNumber instead of native C number types!
    NSNumber *anotherInt = [NSNumber numberWithInt:5];
    NSNumber *finalInt = [NSNumber numberWithInt:9];
    NSNumber *anotherFloat = [NSNumber numberWithFloat: 3.4];
    
    NSNumber *yetAnotherInt = [NSNumber numberWithInt: 90];
    
    // If we want to do some operations on NSNumbers, you must grab the value of
    // the object, which will be a native C type.
    // Notice how below, we can do an operation between the intValue property of
    // an NSNumber object with a Native C int variable.
    int sum = anotherInt.intValue + myInt;
    NSNumber *numSum = [NSNumber numberWithInt:sum];
    
    NSNumber *sumNum = [NSNumber numberWithInt: [yetAnotherInt intValue] + [anotherInt intValue]];
    NSLog(@"Sum: %@", sumNum);
    
    // Identical if you use dot syntax as well
    NSNumber *sumNum2 = [NSNumber numberWithInt: yetAnotherInt.intValue + anotherInt.intValue];
    NSLog(@"Exact same sum with dot syntax: %@", sumNum2);
    
}


@end
