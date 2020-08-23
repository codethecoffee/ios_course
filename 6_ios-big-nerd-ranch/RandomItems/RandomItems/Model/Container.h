//
//  Container.h
//  RandomItems
//
//  Created by Suzy Lee on 8/21/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface Container : Item
{
    NSArray *_subitems;
}


- (instancetype)initWithContainerName:(NSString *)name subItems:(NSArray *)items;

@end

NS_ASSUME_NONNULL_END
