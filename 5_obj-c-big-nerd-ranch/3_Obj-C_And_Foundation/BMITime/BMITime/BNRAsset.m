//
//  BNRAsset.m
//  BMITime
//
//  Created by Suzy Lee on 8/14/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "BNRAsset.h"

@implementation BNRAsset

- (NSString *)description {
    // Is the holder non-nil?
    if (self.holder) {
        return [NSString stringWithFormat:@"<%@: $%f, held by: %@>", self.label, self.resaleValue, self.holder];
    }
    // The asset is not owned by anybody yet
    else {
        return [NSString stringWithFormat:@"<%@: $%f>", self.label, self.resaleValue];
    }
}

- (void)dealloc {
    NSLog(@"Deallocating %@", self);
}

@end
