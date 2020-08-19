//
//  main.m
//  Appliances
//
//  Created by Suzy Lee on 8/19/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BNRAppliance.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        BNRAppliance *appliance = [[BNRAppliance alloc] init];
        NSLog(@"appliance is: %@", appliance);
        
        [appliance setProductName:@"Dishwasher"];
        [appliance setVoltage:501];
        NSLog(@"appliance is: %@", appliance);
    
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
