//
//  main.m
//  DateList
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-(24.0 * 60.0 * 60.0)];
        
        // An NSArray contains pointers to other NSObjects
        NSMutableArray *dateList = [NSMutableArray arrayWithObjects:now, tomorrow, yesterday, nil];
        
        NSLog(@"There are %lu dates", [dateList count]);
        
        // Use fast enumeration to go through all items
        for (NSDate *d in dateList) {
            NSLog(@"Current date: %@", d);
        }
    }
    return 0;
}
