//
//  main.m
//  TimeAfterTime
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

// Foundation framework contains fundamental classes used in all iOS apps
// We will be using the NSDate class from Foundation
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Pointer to an NSDate object
        NSDate *now = [NSDate date];
        NSLog(@"This NSDate object lives at %p", now);
        NSLog(@"The date is %@", now);
        
        double secondsSince1970 = [now timeIntervalSince1970];
        NSLog(@"It has been %.2f seconds since 1970", secondsSince1970);
        
        NSDate *later = [now dateByAddingTimeInterval:100000000];
        NSLog(@"In 100,000,000 seconds it will be %@", later);
        
        NSCalendar *myCal = [NSCalendar currentCalendar];
        NSLog(@"My calendar is %@", [myCal calendarIdentifier]);
        unsigned long day = [myCal ordinalityOfUnit:NSCalendarUnitDay
                                             inUnit:NSCalendarUnitMonth
                                            forDate:now];
        NSLog(@"This is day %lu of the month", day);
    }
    return 0;
}
