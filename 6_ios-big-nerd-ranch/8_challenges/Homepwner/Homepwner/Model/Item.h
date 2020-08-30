//
//  Item.h
//  RandomItems
//
//  Created by Suzy Lee on 8/21/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject
// Declare instance variables
//{
//    NSString *_itemName;
//    NSString *_serialNumber;
//    int _valueInDollars;
//    NSDate *_dateCreated;
//
//    Item *_containedItem;
//    __weak Item *_container;
//}


@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;

// You should never be able to change the dateCreated field
@property (nonatomic, readonly) NSDate *dateCreated;

// Initializes an Item instance with random values
+ (instancetype)randomItem;

// Designated initializer
- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber valueInDollars:(int)value;
- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;
- (instancetype)initWithItemName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
