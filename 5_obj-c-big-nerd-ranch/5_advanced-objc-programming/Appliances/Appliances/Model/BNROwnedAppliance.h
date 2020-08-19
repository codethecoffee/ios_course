//
//  BNROwnedAppliance.h
//  Appliances
//
//  Created by Suzy Lee on 8/19/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNROwnedAppliance : NSObject
@property (readonly) NSSet *ownerNames;

// The designated initializer
- (instancetype)initWithProductName: (NSString *)productName firstOwnerName:(NSString*)firstName;

- (void)addOwnerName:(NSString *)ownerName;
- (void)removeOwnerName:(NSString *)ownerName;
@end

NS_ASSUME_NONNULL_END
