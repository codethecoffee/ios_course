//
//  main.m
//  Stocks
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRStockHolding *zappleStock = [[BNRStockHolding alloc] init];
        [zappleStock setNumberOfShares:5000];
        [zappleStock setCurrentSharePrice:1000000];
        [zappleStock setPurchaseSharePrice:32];
        [zappleStock setSymbol:@"ZAPPL"];
        
        BNRStockHolding *suzyStock = [BNRStockHolding new];
        [suzyStock setNumberOfShares:100];
        [suzyStock setCurrentSharePrice:54];
        [suzyStock setPurchaseSharePrice:32];
        [suzyStock setSymbol:@"SSL"];
        
        BNRStockHolding *tomStock = [BNRStockHolding new];
        [tomStock setNumberOfShares:74];
        [tomStock setCurrentSharePrice:200];
        [tomStock setPurchaseSharePrice:910];
        [tomStock setSymbol:@"TLS"];
        
        BNRStockHolding *graceStock = [BNRStockHolding new];
        [graceStock setNumberOfShares:34];
        [graceStock setCurrentSharePrice:391];
        [graceStock setPurchaseSharePrice:21];
        [graceStock setSymbol:@"GGS"];
        
        BNRForeignStockHolding *yingStock = [[BNRForeignStockHolding alloc] init];
        [yingStock setNumberOfShares:34];
        [yingStock setCurrentSharePrice:391];
        [yingStock setPurchaseSharePrice:21];
        [yingStock setConverionRate:0.5];
        [yingStock setSymbol:@"YYS"];
        
        BNRPortfolio *myPortfolio = [[BNRPortfolio alloc] init];
        [myPortfolio setHoldings:[NSMutableArray arrayWithObjects:suzyStock, tomStock, graceStock, zappleStock, yingStock, nil]];
        NSLog(@"Three top holdings: %@", [myPortfolio getThreeTopHoldings]);
        NSLog(@"Stocks sorted by symbol: %@", [myPortfolio sortBySymbol]);
        
        
    }
    return 0;
}
