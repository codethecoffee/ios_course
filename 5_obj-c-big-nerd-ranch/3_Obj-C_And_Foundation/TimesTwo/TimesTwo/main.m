//
//  main.m
//  TimesTwo
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *currentTime = [NSDate date];
        NSLog(@"currentTime value: %p", currentTime);
        NSDate *startTime = currentTime;
        
        sleep(2);
        
        currentTime = [NSDate date];
        NSLog(@"currentTime value: %p", currentTime);
        NSLog(@"Address of the original currentTime object: %p", startTime);
        
        NSString *sentence = @"Once upon a time, there was a girl named Suzy.";
        NSString *myName = @"suzy";
        
        if ([sentence localizedCaseInsensitiveContainsString:myName]) {
            NSLog(@"The sentence contains my name!");
        } else {
            NSLog(@"No shout-out");
        }
    }
    return 0;
}
