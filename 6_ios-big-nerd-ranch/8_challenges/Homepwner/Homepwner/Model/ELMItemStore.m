//
//  ELMItemStore.m
//  Homepwner
//
//  Created by Suzy Lee on 8/30/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ELMItemStore.h"
#import "Item.h"

// static variable allocates sharedStore on the heap, NOT the stack
static ELMItemStore *sharedStore = nil;

@interface ELMItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end


@implementation ELMItemStore

+ (instancetype)sharedStore {
    
    static ELMItemStore *sharedStore = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedStore = [[ELMItemStore alloc] init];
        NSLog(@"Initialize the sharedStore");
    });
    
    // Ensures that two instances are never created, plus dispatch_once
    // makes sure it is thread safe, and it is faster than @synchronous
    
    return sharedStore;
}

- (Item *)createItem {
    Item *currItem = [Item randomItem];
    
    if (!_privateItems) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    [self.privateItems addObject:currItem];
    
    return currItem;
}

- (NSArray *)allItems {
    return _privateItems;
}


@end
