//
//  NSString+BNRVowelCounting.m
//  VowelCounter
//
//  Created by Suzy Lee on 8/19/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "NSString+BNRVowelCounting.h"


@implementation NSString (BNRVowelCounting)
- (int)bnr_vowelCount {
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"];
    NSUInteger count = [self length];
    int sum = 0;
    
    for (int i =0; i < count; i++) {
        unichar c = [self characterAtIndex:i];
        if ([charSet characterIsMember:c]) {
            sum++;
        }
    }
    return sum;
}
@end
