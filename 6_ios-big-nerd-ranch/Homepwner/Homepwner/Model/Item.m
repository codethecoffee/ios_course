//
//  Item.m
//  RandomItems
//
//  Created by Suzy Lee on 8/21/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "Item.h"
#import "Container.h"

@implementation Item


+ (instancetype)randomItem {
    NSArray *randomAdjectives = @[@"Delicious", @"Gross", @"Stale", @"Cold", @"Hot"];
    
    NSArray *randomFoodItems = @[@"Steak", @"Lobster", @"Pasta"];
    
    // Get the index of a random adjective/noun
    NSInteger adjIndex = arc4random() % [randomAdjectives count];
    NSInteger foodIndex = arc4random() % [randomFoodItems count];
    
    // Create a random food name by combining the two strings
    NSString *itemName = [NSString stringWithFormat:@"%@ %@", randomAdjectives[adjIndex], randomFoodItems[foodIndex]];
    
    int randomValue = arc4random() % 100;
    NSString *serialNumber = [NSString stringWithFormat:@"%d%d%d%d",
                              'A' + arc4random()%26,
                              'A' + arc4random()%26,
                              'A' + arc4random()%26,
                              'A' + arc4random()%26];
    
    Item *newItem = [[self alloc] initWithItemName:itemName serialNumber:serialNumber valueInDollars:randomValue];
    
    return newItem;
    
}

- (NSString *)description {
    NSString *str = [[NSString alloc] initWithFormat:@"<%@: %@> $%d, date: %@", _itemName, _serialNumber, _valueInDollars, _dateCreated];
    return str;
}

// Designated initializer for Item
- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber valueInDollars:(int)value {
    // Call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if (self) {
        // Give the instance variables the initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        // Set _dateCreated to the current date and time
        _dateCreated = [NSDate date];
    }
    
    // Return address of the newly initialized object
    return self;
}

- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber {
    return [self initWithItemName:name serialNumber:sNumber valueInDollars:0];
}

// Call the designated initializer in this sub initializer!
- (instancetype)initWithItemName:(NSString *)name {
    return [self initWithItemName:name serialNumber:@"" valueInDollars:0];
}


// Override the NSObject init method to make sure that all
// the ivars of the custom Item object are initialized
- (instancetype)init {
    return [self initWithItemName:@"Item"];
}

- (void)dealloc {
    NSLog(@"Destroyed: %@", self);
}



@end
