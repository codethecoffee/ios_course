//
//  BNREmployee.m
//  BMITime
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAsset.h"
@interface BNREmployee ()
@property (nonatomic) NSMutableSet *_assets;
@property (nonatomic) unsigned int officeAlarmCode;
@end

@implementation BNREmployee

- (double)yearsOfEmployment {
    // Do I have a non-nil hireDate?
    if ([self hireDate]) {
        NSDate *now = [NSDate date];
        
        // NSTimeInterval is an alias for a double
        NSTimeInterval seconds = [now timeIntervalSinceDate:[self hireDate]];
        double numYears = seconds / 31557600.0;
        
        return numYears;
    } else {
        return 0;
    }
}

// All employees (for some reason) have a 10% higher BMI
// than the normal person equivalent.
- (float)bodyMassIndex {
    float normalBMI = [super bodyMassIndex];
    return normalBMI*1.1;
}


- (NSString *)description {
    if (!self.employeeID) {
        return [NSString stringWithFormat:@"<Undefined employee>"];
    } else {
        return [NSString stringWithFormat:@"<Employee %d, $%d in assets>", self.employeeID, [self valueOfAssets]];
    }
}

- (void)addAsset:(BNRAsset*)newAsset {
    if (!__assets) {
        NSLog(@"This is the first asset you're adding!");
        __assets = [[NSMutableSet alloc] init];
    }
    [__assets addObject:newAsset];
    newAsset.holder = self;
}

- (int)valueOfAssets{
    // If the employee does not have any assets yet
    if (!self._assets) {
        return 0;
    }
    
    int totalValue = 0;
    
    for (BNRAsset *currAsset in self._assets) {
        totalValue += currAsset.resaleValue;
    }
    
    return totalValue;
}

- (void)dealloc {
    NSLog(@"deallocating: %@", self);
}

@end
