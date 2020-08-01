//
//  ViewController.m
//  Distance Calculator
//
//  Created by Suzy Lee on 8/1/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"

@interface ViewController ()
@property (nonatomic) DGDistanceRequest *req;

@property (weak, nonatomic) IBOutlet UITextField *startLocation;
@property (weak, nonatomic) IBOutlet UITextField *firstDestination;
@property (weak, nonatomic) IBOutlet UITextField *secondDestination;
@property (weak, nonatomic) IBOutlet UITextField *thirdDestination;
@property (weak, nonatomic) IBOutlet UILabel *firstDistance;
@property (weak, nonatomic) IBOutlet UILabel *secondDistance;
@property (weak, nonatomic) IBOutlet UILabel *thirdDistance;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSelector;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)calculateDistances:(id)sender {
    // Disable button while we wait for response
    [_calculateButton setEnabled:NO];
    
    _req = [DGDistanceRequest alloc];
    
    // Grab all the text inputted by the user
    NSString *start = [_startLocation text];
    NSString *firstDest = [_firstDestination text];
    NSString *secDest = [_secondDestination text];
    NSString *thirdDest = [_thirdDestination text];
    
    NSArray *dests = @[firstDest, secDest, thirdDest];
    _req = [_req initWithLocationDescriptions:dests sourceDescription:start];
    
    // Use weakSelf to establish weak link and break cycle in req.callback that
    // may result in a memory link => app crashing from user interacting
    // with the app too much
    __weak ViewController *weakSelf = self;
    
    // Assign a Obj-C block to be the callback function
    // Note that this does NOT run the Obj-C block
    _req.callback = ^(NSArray *responses){
        ViewController *strongSelf = weakSelf;
        
        // Means that weakSelf was deallocated before we could even define this block
        if (!strongSelf) return;
        
        NSNull *badResult = [NSNull null];
        double divisor = 1;
        NSString *selectedUnit = [NSString new];
        
        if (strongSelf.unitSelector.selectedSegmentIndex == 0) {
            selectedUnit = @"m";
        } else if (strongSelf.unitSelector.selectedSegmentIndex == 1) {
            selectedUnit = @"km";
            divisor = 1000.0;
        } else {
            selectedUnit = @"miles";
            divisor = 1609.0;
        }
        
        // Get first destination result and set text
        if (responses[0] != badResult) {
            double num = [responses[0] floatValue];
            NSString *x = [NSString stringWithFormat:@"%.0f %@", (num/divisor), selectedUnit];
            [strongSelf.firstDistance setText:x];
        } else {
            [strongSelf.firstDistance setText:@"Error"];
        }
        
        // Get second destination result and set text
        if (responses[1] != badResult) {
            double num = [responses[1] floatValue];
            NSString *x = [NSString stringWithFormat:@"%.0f %@", (num/divisor), selectedUnit];
            [strongSelf.secondDistance setText:x];
        } else {
            [strongSelf.secondDistance setText:@"Error"];
        }
        
        // Get third destination result and set text
        if (responses[2] != badResult) {
            double num = [responses[2] floatValue];
            NSString *x = [NSString stringWithFormat:@"%.0f %@", (num/divisor), selectedUnit];
            [strongSelf.thirdDistance setText:x];
        } else {
            [strongSelf.thirdDistance setText:@"Error"];
        }
        
        // Set back to nil, so ARC knows that it can start re-claiming the space
        // since the cycle has ended!
        strongSelf.req = nil;
        [strongSelf.calculateButton setEnabled:YES];
    };
    
    // Actually triggers the DGDistanceRequest
    [_req start];
}


@end
