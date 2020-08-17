//
//  main.m
//  Callbacks
//
//  Created by Suzy Lee on 8/15/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNRLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRLogger *logger = [[BNRLogger alloc] init];
        
        // Target-action mechanism
        // Triggers the updateLastTime selector every 2 seconds.
        // Target: BNRLogger instance (object receiving the message)
        // Action: updateLastTime instance method.
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
        
        
        //////////////////////////////
        // NETWORKING IN OBJECTIVE-C//
        /////////////////////////////
        // OPTION 1: Passing in a block to use as a completion handler
        NSURL *imageURL = [NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/7/7f/Williams_River-27527.jpg"];
        
        NSURLSessionDownloadTask *downloadPhotoTask =
        [[NSURLSession sharedSession]
         downloadTaskWithURL:imageURL
         completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                NSLog(@"error: %@", [error localizedDescription]);
            } else {
                NSLog(@"Contents of the HTTP response: %@", response);
            }
        }];

        [downloadPhotoTask resume];
        
        // OPTION 2: Use protocols and delegates instead of a completion handler
//        NSURL *catImageURL = [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/d/d7/1-month-old_kitten_35.jpg"];
//
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:catImageURL];
//        NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
//        __unused NSURLSession *fetchCatSession =
//        [NSURLSession sessionWithConfiguration:defaultConfig delegate:logger delegateQueue:nil];
//
//        NSURLSessionDataTask * dataTask = [fetchCatSession dataTaskWithRequest:request];
//        [dataTask resume];
//
        /////////////////////////
        // NOTIFICATION CENTER //
        ////////////////////////
        // Step 1: Initialize an instance of NSNotificationCenter. Typically, you'll just need one
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        
        // OPTION 1: Add an observer using CALLBACKS
        // Step 2: Add an observer to this notification center. Here's a breakdown of the parameters:
        //         name: The notification the observer is listening/waiting for.
        //         addObserver: The object with a method that will be triggered upon receiving the
        //                      notification specified in the "name" parameter.
        //         selector: The method of the observer that will be triggered upon receiving the
        //                   specified notification.
        [notificationCenter
         addObserver:logger
         selector:@selector(zoneChange:)
         name:NSSystemTimeZoneDidChangeNotification
         object:nil];
        
        // OPTION 2: Add an observer using a BLOCK
        // Step 2: Add an observer to this notification center.
        //         Note: The queue parameter is used for concurrency. Don't worry about it for now.
        [notificationCenter
         addObserverForName:NSSystemTimeZoneDidChangeNotification
         object:nil queue:nil
         usingBlock:^(NSNotification * _Nonnull note) {
            NSLog(@"***TIME ZONE CHANGED NOTIFICATION WITH BLOCK!");
        }];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
