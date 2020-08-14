//
//  BNRForeignStockHolding.h
//  Stocks
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNRForeignStockHolding : BNRStockHolding
@property (nonatomic) float converionRate;

@end

NS_ASSUME_NONNULL_END
