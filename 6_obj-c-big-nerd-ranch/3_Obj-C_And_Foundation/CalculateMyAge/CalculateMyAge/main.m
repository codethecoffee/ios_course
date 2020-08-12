//
//  main.m
//  CalculateMyAge
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSDate object of current time
        NSDate *now = [NSDate date];
        NSDateComponents *components = [NSDateComponents new];
        [components setYear:1998];
        [components setMonth:9];
        [components setDay:24];
        [components setHour:0];
        [components setMinute:0];
        [components setSecond:0];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *myBirthday = [g dateFromComponents:components];
        
        double timeInterval = [now timeIntervalSinceDate:myBirthday];
        NSLog(@"Seconds since birth: %.2f", timeInterval);
        
        
    }
    return 0;
}
