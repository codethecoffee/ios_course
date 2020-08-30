//
//  main.m
//  RandomItems
//
//  Created by Suzy Lee on 8/21/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "Container.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create 10 random items and log their descriptions
        NSMutableArray *randomItems = [[NSMutableArray alloc] init];
        
        Item *backpack = [[Item alloc] initWithItemName:@"Backpack" serialNumber:@"123456" valueInDollars:25];
        [randomItems addObject:backpack];
        
        Item *calculator = [[Item alloc] initWithItemName:@"Calculator" serialNumber:@"ABCDEF" valueInDollars:80];
        [randomItems addObject:calculator];
        
        NSLog(@"Backpack: %@", backpack);
        NSLog(@"Calculator: %@", calculator);
                
        [backpack setContainedItem:calculator];
        
        backpack = nil;
        calculator = nil;
        
        for (Item *currItem in randomItems) {
            NSLog(@"%@", currItem);
        }
        
        
        NSLog(@"Setting items to nil...");
        // Destroy the mutable array object
        randomItems = nil;
    }
    return 0;
}
