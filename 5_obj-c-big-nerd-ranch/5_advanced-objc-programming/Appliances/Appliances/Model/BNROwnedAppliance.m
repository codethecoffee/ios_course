//
//  BNROwnedAppliance.m
//  Appliances
//
//  Created by Suzy Lee on 8/19/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "BNROwnedAppliance.h"

@implementation BNROwnedAppliance
{
    NSMutableSet *_ownerNames;
}

- (instancetype)initWithProductName:(NSString *)productName firstOwnerName:(NSString *)firstName {
    if (self = [super init]) {
        // Initialize the set to hold owner names
        _ownerNames = [[NSMutableSet alloc] init];
        
        // If the given name is not nil, add it to ownerNames
        if (firstName) {
            [_ownerNames addObject: firstName];
        }
    }
    
    return self;
}

- (void)addOwnerName:(NSString *)ownerName {
    [_ownerNames addObject:ownerName];
}

- (void)removeOwnerName:(NSString *)ownerName {
    [_ownerNames removeObject:ownerName];
}

- (NSSet *)ownerNames {
    return [_ownerNames copy];
}

@end
