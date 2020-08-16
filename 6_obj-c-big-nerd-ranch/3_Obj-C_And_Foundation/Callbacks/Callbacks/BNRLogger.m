//
//  BNRLogger.m
//  Callbacks
//
//  Created by Suzy Lee on 8/15/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger
- (NSString *)lastTimeString {
    // By declaring as a static variable, makes sure all instances of
    // BNRLogger share a single instance of NSDateFormatter.
    
    // Other OOP languages have class variables to serve this purpose,
    // but Objective-C just uses static variables
    static NSDateFormatter *dateFormatter = nil;
    
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter");
    }
    
    return [dateFormatter stringFromDate:self.lastTime];
    
}
/**
 Logs the current time stamp.
 */
- (void)updateLastTime:(NSTimer *)t {
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"Just set time to %@", self.lastTimeString);
}


/**
  PROTOCOL: NSURLSessionDataDelegate
  Tells the delegate that the data task has received a CHUNK of data.
  This is NOT called when the data task is complete.
 
  session: The session containing the data task that provided data
  dataTask: The data task that provided data
  data: A data object containing the transferred data
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSLog(@"received %lu bytes", [data length]);
    
    // Create a mutable data instance if it does not already exist
    // Otherwise, you won't have an instance to append the data chunk to!
    if (!_incomingData) {
        _incomingData = [[NSMutableData alloc] init];
    }
    
    [_incomingData appendData:data];
    
}


/**
 PROTOCOL: NSURLSessionTaskDelegate
 Tells the delegate that the task finished transferring data,
 a.k.a. after the last chunk of data has been processed.
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"Completed the data task: %@", task);
    
    // Convert NSData object into an NSString using initWithData method
    NSString *dataString = [[NSString alloc] initWithData:_incomingData encoding:NSUTF8StringEncoding];
    
    NSLog(@"All of the data packets: %@", dataString);
    
    if (error) {
        NSLog(@"error: %@", [error localizedDescription]);
    } else {
        NSLog(@"No error, yaaaay");
    }
}


/**
 Triggered when BNRLogger instance receives the N​S​S​y​s​t​e​m​T​i​m​e​Z​o​n​e​D​i​d​C​h​a​n​g​e​N​o​t​i​f​i​c​a​t​i​o​n
 from the NSNotificationCenter
 */
- (void)zoneChange:(NSNotification *)note {
    NSLog(@"THE TIME ZONE HAS CHANGED WOOHOO!!!");
}

@end
