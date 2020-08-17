//
//  main.m
//  Stockz
//
//  Created by Suzy Lee on 8/17/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ////////////////////
        // PROPERTY LISTS //
        ///////////////////
        
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *stock;
        
        stock = [NSMutableDictionary dictionary];
        [stock setObject:@"AAPL" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:200]
                  forKey:@"shares"];
        [stocks addObject:stock];
        
        stock = [NSMutableDictionary dictionary];
        [stock setObject:@"GOOG" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:1000]
                  forKey:@"shares"];
        [stocks addObject:stock];
        
        // Produces a plist file at the absolute file path
        [stocks writeToFile:@"/tmp/stocks.plist" atomically:YES];
        
        
        // Read in the contents of this file to an NSArray
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        
        for (NSDictionary *currStock in stockList) {
            NSLog(@"I have %@ shares of %@", [currStock objectForKey:@"shares"], [currStock objectForKey:@"symbol"]);
        }
        
    }
    return 0;
}
