//
//  Container.m
//  RandomItems
//
//  Created by Suzy Lee on 8/21/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "Container.h"

@implementation Container

// This is the designated initializer
- (instancetype)initWithContainerName:(NSString *)name subItems:(NSArray *)items {
    // Calculate sum of all the items in container
    int totalValue = 0;
    for (Item *currItem in items) {
        totalValue += currItem.valueInDollars;
    }
    
    self = [super initWithItemName:name serialNumber:@"" valueInDollars:totalValue];
    _subitems = items;
    
    return self;
}

// Override default init method
- (instancetype)init {
    return [self initWithContainerName:@"" subItems:@[]];
}

// Custom description method for BNRContainer
- (NSString *)description {
    NSMutableString *d = [NSMutableString stringWithFormat:@"<%@: $%d>", self.itemName, self.valueInDollars];
    
    NSMutableString *itemDesc = [[NSMutableString alloc] init];
    
    for (Item *currItem in _subitems) {
        [itemDesc appendString: [currItem description]];
    }
    [d appendString:itemDesc];
    return d;
}

@end
