//
//  BNRObserver.m
//  Callbacks
//
//  Created by Suzy Lee on 8/19/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "BNRObserver.h"

@implementation BNRObserver

// The method called whenever lastTime is changed
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSString *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    NSString *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    NSLog(@"Observed: %@ of %@ was changed from %@ to %@", keyPath, object, oldValue, newValue);
    
}

@end
