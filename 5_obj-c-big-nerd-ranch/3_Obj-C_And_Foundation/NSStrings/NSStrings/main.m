//
//  main.m
//  NSStrings
//
//  Created by Suzy Lee on 8/15/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *coolString = [[NSMutableString alloc] init];
        
        for (int i = 0; i < 10; i++) {
            [coolString appendString:@"Suzy is cool. "];
        }
        
        // Declare a pointer to an NSError object, but do not instantiate it.
        // The NSError instance will only be created if there is, in fact, an error
        NSError *writingError; // This is the pass-by-reference technique used in C
        
        // Pass the NSError pointer by reference to the NSString method
        // writeToFile returns YES if file writing was successful, NO if not
        BOOL success = [coolString writeToFile:@"/too/darned/bad.txt" atomically:YES encoding:NSUTF8StringEncoding error: &writingError]; // &: "memory-address-of" operator
        
        // Check whether the write was successful. If not, NSLog the error
        if (success) {
            NSLog(@"File write was successful!");
        } else {
            NSLog(@"Error: %@", [writingError localizedDescription]);
        }
        
        
        NSError *readError;
        NSString *newStr = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf" encoding:NSUTF8StringEncoding error:&readError];
        
        // If the read was successful, NSLog it. Otherwise, return a user-friendly error message
        if (!newStr) {
            NSLog(@"read failed: %@", [readError localizedDescription]);
        } else {
            NSLog(@"contents of resolve.conf: %@", newStr);
        }
        
        
        
    }
    return 0;
}
