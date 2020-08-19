//
//  BNRAppliance.m
//  Appliances
//
//  Created by Suzy Lee on 8/19/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

- (instancetype)init {
    return [self initWithProductName:@"Unknown"];
    
}

- (instancetype)initWithProductName:(NSString *)productName {
    // If NSObject init method executes properly
    
    if (self = [super init]) {
        self.productName = [productName copy];
        self.voltage = 120;
    }
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %d volts>", self.productName, self.voltage];
}

@end
