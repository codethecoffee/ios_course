//
//  BNREmployee.h
//  BMITime
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"
#import "BNRAsset.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate;

- (double)yearsOfEmployment;
- (int)valueOfAssets;
- (void)addAsset:(BNRAsset *)newAsset;

@end

NS_ASSUME_NONNULL_END
