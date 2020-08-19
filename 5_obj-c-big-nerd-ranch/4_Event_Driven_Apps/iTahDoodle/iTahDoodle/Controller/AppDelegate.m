//
//  AppDelegate.m
//  iTahDoodle
//
//  Created by Suzy Lee on 8/17/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "AppDelegate.h"

// Helper function to fetch path to to-do data stored on disk
NSString *BNRDocPath() {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Application delegate callbacks
/**
 This is where you put everything that needs to be done before the user interacts with the app
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"CLOSED OUT OF APP!!!");
    [self.tasks writeToFile:BNRDocPath() atomically: YES];
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

@end
