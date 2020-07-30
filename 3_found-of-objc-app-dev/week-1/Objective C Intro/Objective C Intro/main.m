//
//  main.m
//  Objective C Intro
//
//  Created by Suzy Lee on 7/30/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>


struct Time {
    int day;
    int month;
    int year;
};

void timeGreeting(struct Time myTimeCopy) {
    NSLog(@"%@", [NSString stringWithFormat:@"Year: %d", myTimeCopy.year]);
}

int main(int argc, const char * argv[]) {
    struct Time myTime;
    
    myTime.month = 6;
    myTime.day = 29;
    myTime.year = 2007;
    
    timeGreeting(myTime);
    
    return 0;
}
