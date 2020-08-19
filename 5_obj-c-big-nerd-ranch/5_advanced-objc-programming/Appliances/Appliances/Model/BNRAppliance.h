//
//  BNRAppliance.h
//  Appliances
//
//  Created by Suzy Lee on 8/19/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRAppliance : NSObject

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

// The designated initializer
- (instancetype)initWithProductName:(NSString *)productName;

@end

NS_ASSUME_NONNULL_END
