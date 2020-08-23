//
//  main.m
//  ClassAct
//
//  Created by Suzy Lee on 8/20/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/runtime.h>

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        
        // Declare a variable to hold the number of registered classes
        unsigned int classCount = 0;
        
        // Get a pointer to a list of all registered classes currently loaded
        // by your application. The number of registered classes is returned
        // by reference
        Class *classList = objc_copyClassList(&classCount);
        
        // For each class in the list...
        for (int i = 0; i < classCount; i++) {
            // Treat the classList as a C array to get a Class from it
            Class currentClass = classList[i];
            
            
            // Get the class's name as a string
            NSString *className = NSStringFromClass(currentClass);
            
            // Log the class's name
            NSLog(@"%@", className);
            
        }
        
        // We're done with teh class list buffer, so free it
        free(classList);
        
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
