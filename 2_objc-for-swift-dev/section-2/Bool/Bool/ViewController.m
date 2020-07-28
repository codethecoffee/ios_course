//
//  ViewController.m
//  Bool
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
    
    // This is the BOOL we use! This is the Objective-C bool
    // Always use YES or NO instead of true or false
    BOOL amICool = YES;
    BOOL amIStillCool = NO;
    
    // Never use these three types of booleans below
    bool sayWhat;
    Boolean hmmm;
    boolean_t grrrr;
    
    if (amICool) {
        NSLog(@"Good job, you're not lame.");
    } else {
        NSLog(@"Ooof you're lame, sorry");
    }
    
    if (55 != 22 && amICool != amIStillCool) {
        NSLog(@"You're not cool anymore");
    }
    
    
    NSString *name = nil;
    // This returns false if the object is undefined (a.k.a. nil == NO in an if statement)
    if (name) {
        NSLog(@"Name: %@", name);
    }
    
    if (!name) {
        name = @"Suzy";
    }
}


@end
