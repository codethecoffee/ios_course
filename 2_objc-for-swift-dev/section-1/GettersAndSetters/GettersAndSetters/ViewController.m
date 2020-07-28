//
//  ViewController.m
//  GettersAndSetters
//
//  Created by Suzy Lee on 7/28/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"
#import "Vehicle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Vehicle *car = [[Vehicle alloc]init];
    
    // After customizing our setter, we now block this reassignment;
    // we don't want any negative values for the odometer
    car.odometer = -100;
    
    // This returns 0, because the setter does not set the odometer to
    // negative values
    NSLog(@"Odometer: %lu", car.odometer);
    
    car.model = @"Honda Civic";
    NSLog(@"Make and Model: %@", car.model);
}


@end
