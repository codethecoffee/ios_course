//
//  main.m
//  GroceryList
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *groceryList = [NSMutableArray arrayWithObjects:@"Loaf of bread", @"Container of milk", @"Stick of butter", nil];
        
        for (NSString *currItem in groceryList) {
            NSLog(@"Current item: %@", currItem);
        }
    }
    return 0;
}
