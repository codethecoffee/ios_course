//
//  BNRPerson.m
//  BMITime
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson
- (float)bodyMassIndex {
    float currHeight = [self heightInMeters];
    float currWeight = [self weightInKilos];
    
    return currWeight / (currHeight * currHeight);
}

@end
