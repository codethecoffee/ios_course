//
//  ViewController.m
//  Strings
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
    
    NSString *firstName = @"Suzy";
    // You can "technically" do the thing below, but nobody ever does this.
    // Just immediately set it to a string literal like the line above,
    // it's way more convenient.
    NSString *allocatedString = [[NSString alloc]init];
    
    // NSLog always takes a format string with string interpolation,
    NSLog(@"Print my name: %@", firstName);
    
    // String concatenation
    // We call the STATIC NsString method "stringWithFormat"
    NSString *fullName = [NSString stringWithFormat: @"%@ MiddleName %@", firstName, @"Lee"];
    
    NSString *display = [fullName stringByAppendingString:@" died in 3074"];
    
    NSLog(@"Fullname: %@", fullName);
    
    NSString *var1 = @"Cats";
    NSString *var2 = @"meow";
    NSString *var3 = @"cats";
    
    if (![var1 isEqualToString:var2]) {
        NSLog(@"The string are not equal!");
    }
    
    if ([var1 isEqualToString:var3]) {
        NSLog(@"The strings are equal!");
    }
   
    if ([var1 caseInsensitiveCompare:var3] == NSOrderedSame) {
        NSLog(@"Strings are equal, ignoring cases!");
    }
}


@end
