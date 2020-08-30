//
//  ELMItemStore.h
//  Homepwner
//
//  Created by Suzy Lee on 8/30/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Item;

NS_ASSUME_NONNULL_BEGIN

@interface ELMItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

// Notice how this is a CLASS method, and is thus prefixed with a +
+ (ELMItemStore *)sharedStore;
- (Item *)createItem;

@end

NS_ASSUME_NONNULL_END
