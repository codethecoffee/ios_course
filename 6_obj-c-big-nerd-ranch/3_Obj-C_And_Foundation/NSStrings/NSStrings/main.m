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
        
        [coolString writeToFile:@"/tmp/cool.txt" atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        NSLog(@"done writing to /tmp/cool/txt");
    }
    return 0;
}
