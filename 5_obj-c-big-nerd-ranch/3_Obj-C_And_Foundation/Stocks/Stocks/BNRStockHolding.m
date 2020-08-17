//
//  BNRStockHolding.m
//  Stocks
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding
- (float)costInDollars {
    return [self purchaseSharePrice] * [self numberOfShares];
}

- (float)valueInDollars {
    return [self currentSharePrice] * [self numberOfShares];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: $%.2f>", self.symbol, [self valueInDollars]];
}
@end
