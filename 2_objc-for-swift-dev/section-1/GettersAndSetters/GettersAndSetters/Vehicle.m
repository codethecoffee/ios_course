//
//  Vehicle.m
//  GettersAndSetters
//
//  Created by Suzy Lee on 7/28/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "Vehicle.h"

@interface Vehicle ()

@end

@implementation Vehicle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 Overwritten setter
 */
-(void)setOdometer:(long)odometer {
    // If the incoming odometer value is greater than what currently exists,
    // set it.
    if (odometer > _odometer) {
        _odometer = odometer;
    }
    // Otherwise, don't do anything
}

/**
 Overwritten getter
 */
-(NSString*)model {
    if ([_model isEqualToString: @"Honda Civic"]) {
        return @"ha, terrible";
    } else {
        return _model;
    }
}

@end
