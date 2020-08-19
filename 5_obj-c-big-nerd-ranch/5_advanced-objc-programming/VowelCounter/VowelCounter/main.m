//
//  main.m
//  VowelCounter
//
//  Created by Suzy Lee on 8/19/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NSString+BNRVowelCounting.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        NSString *string = @"Hello World!";
        NSLog(@"%@ has %d vowels", string, [string bnr_vowelCount]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
