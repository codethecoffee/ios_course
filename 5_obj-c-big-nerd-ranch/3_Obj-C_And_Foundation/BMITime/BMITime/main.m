//
//  main.m
//  BMITime
//
//  Created by Suzy Lee on 8/13/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create ten employees
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        // Create an executives dictionary
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNREmployee *newEmployee = [[BNREmployee alloc] init];
            
            [newEmployee setEmployeeID:100 - (i*5)];
            [employees addObject:newEmployee];
            
            if (i == 0) {
                [executives setObject:newEmployee forKey:@"CEO"];
            }
            
            if (i == 1) {
                [executives setObject:newEmployee forKey:@"CTO"];
            }
            
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        // Create ten assets and assign them to random employees
        for (int i = 0; i < 10; i++) {
            BNRAsset *newAsset = [[BNRAsset alloc] init];
            
            [newAsset setLabel:[NSString stringWithFormat:@"STOCK%d", i]];
            [newAsset setResaleValue:i*17];
            
            // Get a random number between 0 and 9 inclusive
            NSUInteger randomNum = random() % [employees count];
            
            // Find that employee and set it as the holder of newAsset
            BNREmployee *randomEmployee = employees[randomNum];
            [newAsset setHolder:randomEmployee];
            
            // Add the asset to the employee
            [randomEmployee addAsset:newAsset];
            
            
            // Add the newly created asset to the assets array
            [allAssets addObject:newAsset];
        }
        
        
        NSSortDescriptor *sortByValue = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *sortByID = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        // Sort the employees by increasing value of assets
        // If they have the same values, sort by increasing employee ID
        [employees sortUsingDescriptors:@[sortByValue, sortByID]];
        
        NSPredicate *assetPredicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
        // We will reclaim all the assets given to employees with more than $70 total
        NSArray *assetsToReclaim = [allAssets filteredArrayUsingPredicate:assetPredicate];
        NSLog(@"assetsToReclaim: %@", assetsToReclaim);
        NSLog(@"Executives: %@", executives);
        executives = nil;
        NSLog(@"Sorted employees: %@", employees);
        
        employees = nil;
        allAssets = nil;
        
    }
    return 0;
}
