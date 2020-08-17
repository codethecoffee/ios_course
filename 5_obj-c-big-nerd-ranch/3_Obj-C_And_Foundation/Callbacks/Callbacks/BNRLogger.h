//
//  BNRLogger.h
//  Callbacks
//
//  Created by Suzy Lee on 8/15/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRLogger : NSObject <NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate>
{
    // Instance variable to hold incoming data
    NSMutableData *_incomingData;
}

@property (nonatomic) NSDate *lastTime;
- (NSString *)lastTimeString;
- (void)updateLastTime:(NSTimer *)t;
- (void)zoneChange:(NSNotification *)note;

@end

NS_ASSUME_NONNULL_END
