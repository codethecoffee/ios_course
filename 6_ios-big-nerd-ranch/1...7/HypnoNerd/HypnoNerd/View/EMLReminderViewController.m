//
//  EMLReminderViewController.m
//  HypnoNerd
//
//  Created by Suzy Lee on 8/24/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "EMLReminderViewController.h"

@interface EMLReminderViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *remindButton;

@end

@implementation EMLReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Reminder view is loaded!");
}


/**
 View Controller receives this message just BEFORE its view is added to the window
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

/**
 Create a LOCAL NOTIFICATION to display.
 A local notification is a way for an application to alert the user even when the app is not currently running.
 Read Apple's Local and Push Notification Programming Guide for more info.
 */
- (IBAction)addReminder:(id)sender {
    // Get the current selected date from the UIDatePicker
    NSDate *date = _datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    // Create a local notification to display at date
    // Note: UILocalNotification is now deprecated
    
}

@end
