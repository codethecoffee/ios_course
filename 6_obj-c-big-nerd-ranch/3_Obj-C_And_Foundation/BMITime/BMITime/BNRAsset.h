//
//  BNRAsset.h
//  BMITime
//
//  Created by Suzy Lee on 8/14/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRAsset.h"
@class BNREmployee;

NS_ASSUME_NONNULL_BEGIN

@interface BNRAsset : NSObject
@property (nonatomic) NSString *label;
@property (nonatomic) float resaleValue;
@property (nonatomic, weak) BNREmployee *holder; // Employee who owns the asset


@end

NS_ASSUME_NONNULL_END
