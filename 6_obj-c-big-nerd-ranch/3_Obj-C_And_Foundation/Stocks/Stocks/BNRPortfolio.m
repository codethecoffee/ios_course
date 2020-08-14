//
//  BNRPortfolio.m
//  Stocks
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "BNRPortfolio.h"
#import "BNRStockHolding.h"

@interface BNRPortfolio ()

@property (nonatomic) NSMutableArray *_holdings;

@end

@implementation BNRPortfolio

- (float)totalValue {
    float totalValue = 0.0;
    for (BNRStockHolding *currHold in [self _holdings]) {
        NSLog(@"Current holding: %@", currHold);
        totalValue += [currHold valueInDollars];
    }
    return totalValue;
}

- (void)addStockHolding:(BNRStockHolding *)newHolding {
    [[self _holdings] addObject: newHolding];
}

- (void)removeStockHolding:(BNRStockHolding *)holding {
    [[self _holdings] removeObject:holding];
}

- (void)setHoldings:(NSArray *)holdings {
    self._holdings = [[NSMutableArray alloc] init];
    for (BNRStockHolding *currHolding in holdings) {
        [self._holdings addObject:currHolding];
    }
}

- (NSArray*)holdings {
    return [self _holdings];
}

- (NSArray *)getThreeTopHoldings {
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"valueInDollars" ascending:NO];
    NSArray *sortedHoldings = [self._holdings sortedArrayUsingDescriptors:@[descriptor]];
    NSArray *threeTopHoldings = [sortedHoldings subarrayWithRange:NSMakeRange(0, 3)];
    return threeTopHoldings;
}

- (NSArray *)sortBySymbol {
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"symbol" ascending:YES];
    return [self._holdings sortedArrayUsingDescriptors:@[descriptor]];
}

@end
