//
//  ViewController.m
//  Keyboard Interactions
//
//  Created by Suzy Lee on 8/9/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSNotificationCenter: Broadcasts information about your phone to all
    // registered observers
    
    // Step 1: Connect to the NSNotificationCenter. For now, we'll initialize
    // the default notification center. If you use notifications extensively,
    // it may be best to create multiple NSNotificationCenters (improves app
    // performance bc you scan through a smaller list of observers)
    NSNotificationCenter *ctr = [NSNotificationCenter defaultCenter];
    
    
    // Step 2: Add self as an observer.
    // Step 2.1: self is notificed when the UI keyboard shows.
    // @selector is a custom function called when UIKeyboardWIllShowNotification
    // is broadcasted (a.k.a. when keyboard is displayed)
    [ctr addObserver:self
            selector:@selector(moveKeyboardInResponseToNotification:) name:UIKeyboardWillShowNotification object:nil];
    
}

// IMPORTANT: We must also de-register for notifications when deallocing.
// This code removes all the observers from defaultCenter
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)resizePressed:(id)sender {
    
    // Makes the keyboard go away (since it's the first responder)
    // on click of the button
    [self.textField resignFirstResponder];
}

- (void) moveKeyboardInResponseToNotification: (NSNotification *) notification {
    // Pull out information from the notification object
    // In this case, info about the location of the keyboard
    
    NSDictionary *info = [notification userInfo];
    NSLog(@"%@", info);
    
    CGRect kbRect;
    // CGRectValue shows where the keyboard is on the screen
    kbRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    // floatValue of the duration of the keyboard animation
    CGFloat duration = [[info objectForKey: UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    // How the keyboard animation eases in and eases out
    UIViewAnimationCurve curve = [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue];
    
    // If the autolayout was waiting to layout it, do it right now
    // Close out of anything in the process of animating, so that
    // we can start initiating other animations
    [self.view layoutSubviews];
    
    
    // Start our animations!
    [UIView beginAnimations:nil context:nil];
    // Same duration & curve as the keyboard animation
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    _bottomLayout.constant = kbRect.size.height;
    
    
}


@end
