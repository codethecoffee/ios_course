//
//  AppDelegate.h
//  iTahDoodle
//
//  Created by Suzy Lee on 8/17/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
// Declare a helper function to get path to todo list XML
NSString *BNRDocPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) NSMutableArray *tasks;

@end

