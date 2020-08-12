//
//  main.m
//  GetComputerName
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSHost *myHost = [NSHost currentHost];
        NSString *compName = [myHost localizedName];
        
        NSLog(@"My computer name: %@", compName);
    }
    return 0;
}
