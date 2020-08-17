//
//  main.m
//  InterestingNames
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Read in the propernames file (which comes pre-installed on your Mac)
        // as a huge NSString
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames" encoding:NSUTF8StringEncoding error:NULL];
        
        // Read in the regular + proper name words file, also pre-installed
        NSString *allWordsString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words" encoding:NSUTF8StringEncoding error:NULL];
        
        // Break up NSString into an array of strings
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        NSArray *allWords = [allWordsString componentsSeparatedByString:@"\n"];
        
        NSMutableArray *commonWords = [[NSMutableArray alloc] init];
        
        // Go through each name in the array
        for (NSString *currName in names) {
            for (NSString *currWord in allWords) {
                if ([currName caseInsensitiveCompare:currWord] == NSOrderedSame) {
                    [commonWords addObject:currWord];
                }
            }
        }
        
        NSLog(@"Number of proper names: %lu", (unsigned long)[names count]);
        NSLog(@"Number of dictionary words: %lu", (unsigned long)[allWords count]);
        NSLog(@"Number of common words: %lu", (unsigned long)[commonWords count]);
        
        NSLog(@"%@", commonWords);
        
    }
    return 0;
}
