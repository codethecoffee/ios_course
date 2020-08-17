//
//  main.m
//  ImageFetch
//
//  Created by Suzy Lee on 8/15/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Step 1: Create an NSURL object and an NSURLRequest with that URL
        NSURL *url = [NSURL URLWithString:@"https://www.example.com/"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // Step 2: Create a new NSURLSession, and attach an NSURLSessionDataTask
        //         instance to it. Note that an NSURLSession can have multiple
        //         data tasks attached to it.
        
        // Most of the time, use a sharedSession default configuration
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"The data: %@", data);
        }];
        
        // Step 3: Actually trigger the task. The word "resume" can look confusing
        //         so think of it more like a "play" trigger.
        [task resume];
                
    }
    return 0;
}
