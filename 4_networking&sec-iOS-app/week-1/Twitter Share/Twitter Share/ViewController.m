//
//  ViewController.m
//  Twitter Share
//
//  Created by Suzy Lee on 8/2/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Stylize the tweet text view
    [self configureTextView];
}

- (IBAction)shareTweet:(id)sender {
    // Check whether the UITextField is the first responder
    // (a.k.a. what UI element is in "focus"
    if ([_tweetTextView isFirstResponder]) {
        // If so, close the keyboard to prevent UI conflict
        [_tweetTextView resignFirstResponder];
    }
    
    // Create a pop-up action
    UIAlertController *actionController = [UIAlertController alertControllerWithTitle:@"Share your tweet!" message:@"You are about to tweet stuff." preferredStyle: UIAlertControllerStyleAlert];
    
    // Add an action for the actionController so we can exit out of modal
    // If you do not specify a handler, by default it will be a cancel action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    // Add a social action that actually submits the tweet to Twitter
    // TODO: Integrate Twitter after looking at dev documentation
    // https://developer.twitter.com/en/docs/tweets/post-and-engage/guides/tweet-availability
    UIAlertAction *tweetAction = [UIAlertAction actionWithTitle:@"Tweet" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    }];
    
    [actionController addAction:tweetAction];
    [actionController addAction:cancelAction];
    
    
    // Trigger the pop-up action by sending the View Controller a message
    [self presentViewController:actionController animated:YES completion:nil];
    
}

/**
 Stylizes the tweet text view on app load
 */
- (void) configureTextView {
    // CGFloat is a typedef for float and double that makes it
    // easier to write code that works on 32-bit AND 64-bit.
    
    // TLDR: float in 32-bit system, a double in 64-bit system
    CGFloat red = 35.0, green = 116.0, blue = 171.0;
    
    // colorWithRed takes value in 0~1.0 scale so divide each val by 255
    [_tweetTextView setBackgroundColor: [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:0.2]];
    
    [_tweetTextView.layer setCornerRadius: 10.0];
    [_tweetTextView.layer setBorderWidth: 2.5];
    // Add padding/margin between border and enclosed text
    [_tweetTextView setTextContainerInset: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
}

@end
