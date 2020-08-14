//
//  BNRForeignStockHolding.m
//  Stocks
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "BNRForeignStockHolding.h"

@implementation BNRForeignStockHolding

- (float)costInDollars {
    return [super costInDollars] * [self converionRate];
}

- (float)valueInDollars {
    return [super valueInDollars] * [self converionRate];
}

@end
