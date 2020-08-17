//
//  main.m
//  VowelMovement
//
//  Created by Suzy Lee on 8/17/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

// You can define a block as a typedef for clearer syntax
typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create array of strings and a container for devowelized ones
        NSArray *originalStrings = @[@"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Aishi"];
        
        NSLog(@"original strings: %@", originalStrings);
        
        NSMutableArray *devowelizedStrings = [[NSMutableArray alloc] init];
        
        // Create a list of characters to be removed from the string
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        ArrayEnumerationBlock devowelizer;
        
        // Step 1: Compose a block and assign it to the variable.
        //         The carat in front of the block name & definition indicates that
        //         it is a block and not a "normal" variable.
        
        // BOOL *stop: Lets you specify when you want the block to stop executing in
        //             an enumeration. Common use: set stop value to YES in an if statement
        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            // If we encounter a string with a "y", stop enumerating through the collection!
            if ([newString containsString:@"y"]) {
                *stop = YES; // Prevent further iterations
                return; // End this iteration
            }
            
            // Iterate over the array of vowels, remove all instances of them from newString
            for (NSString *currVowel in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString
                 replaceOccurrencesOfString:currVowel
                 withString:@""
                 options:NSCaseInsensitiveSearch
                 range:fullRange];
            }
            // Add the now devowelized newString to the devowelizedStrings array
            [devowelizedStrings addObject:newString];
            
        }; // End with a semicolon, like any other variable assignment
        
        // ANONYMOUS BLOCKS //
        // You can pass in a named block (devowelizer defined above), or pass it in as an
        // anonymous function like we do below. It's more common to use blocks anonymously
        [originalStrings
         enumerateObjectsUsingBlock:^(id string, NSUInteger i, BOOL *stop) {
             NSMutableString *newString = [NSMutableString stringWithString:string];
             if ([newString containsString:@"y"]) {
                 *stop = YES;
                 return;
             }
             
             for (NSString *currVowel in vowels) {
                 NSRange fullRange = NSMakeRange(0, [newString length]);
                 [newString
                  replaceOccurrencesOfString:currVowel
                  withString:@""
                  options:NSCaseInsensitiveSearch
                  range:fullRange];
             }
             [devowelizedStrings addObject:newString];
         }];
        
        NSLog(@"devowelized strings: %@", devowelizedStrings);
        
    }
    return 0;
}
