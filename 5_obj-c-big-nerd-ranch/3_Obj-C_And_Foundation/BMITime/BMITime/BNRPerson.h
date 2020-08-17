//
//  BNRPerson.h
//  BMITime
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRPerson : NSObject

@property (nonatomic) float heightInMeters;
@property (nonatomic) float weightInKilos;

// BNR has a method that calculates the body Mass Index
- (float)bodyMassIndex;

@end

NS_ASSUME_NONNULL_END
