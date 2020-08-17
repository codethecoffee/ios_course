//
//  main.m
//  ReadlineChallenge
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <readline/readline.h>
#import <stdio.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char *userInput = readline(NULL);
        NSString *objCString = [NSString stringWithUTF8String:userInput];
        NSLog(@"Converted the C string to NSString: %@", objCString);
    
    }
    return 0;
}
