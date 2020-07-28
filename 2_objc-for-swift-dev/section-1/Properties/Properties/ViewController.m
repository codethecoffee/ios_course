//
//  ViewController.m
//  Properties
//
//  Created by Suzy Lee on 7/28/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Person *person1 = [[Person alloc]init];
    person1.firstName = @"Suzy";
    [person1 setLastName: @"Lee"];
    
    
}


@end
