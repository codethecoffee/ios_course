//
//  BNRPortfolio.h
//  Stocks
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRPortfolio : NSObject

@property (nonatomic) float totalValue;
- (void)setHoldings:(NSMutableArray*)holdings;
- (NSArray*)getThreeTopHoldings;
- (NSArray*)sortBySymbol;

@end

NS_ASSUME_NONNULL_END
