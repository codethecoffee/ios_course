//
//  ViewController.m
//  ClassAnatomy
//
//  Created by Suzy Lee on 7/28/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// We can declare local variables we only want accessible in your class
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Name: %@", self.name); // Prints nul
    self.name = @"Suzy Lee";
    NSLog(@"Name: %@", self.name);
    
    _name = @"Jack";
    NSLog(@"Name: %@", _name);
    
    [self setName:@"Sylvia"];
    NSLog(@"Name: %@", [self name]);
}

@end
