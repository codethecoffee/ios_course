//
//  ItemDetailViewController.m
//  Homepwner
//
//  Created by Suzy Lee on 8/31/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Item.h"

@interface ItemDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set self as delegate for all the textFields so we can fire our
    // custom textFieldShouldReturn delegate method
    _nameField.delegate = self;
    _serialField.delegate = self;
    _valueField.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"details for item: %@", self.currItem);
    [super viewWillAppear:YES]; // Call parent implementation
    
    _nameField.text = self.currItem.itemName;
    _serialField.text = self.currItem.serialNumber;
    _valueField.text = [NSString stringWithFormat:@"%d", self.currItem.valueInDollars];
    
    // Create an NSDateFormatter to turn a date into a simple date string
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterShortStyle;
        dateFormatter.timeStyle = kCFTimeZoneNameStyleShortGeneric;
    }
    
    _dateLabel.text = [dateFormatter stringFromDate:self.currItem.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated {
    // Clear the first responder (keyboard) off the screen
    [self.view endEditing:YES];
    
    // Pass updated information back to the table list
    self.currItem.itemName = _nameField.text;
    self.currItem.serialNumber = _serialField.text;
    self.currItem.valueInDollars = [_valueField.text intValue];
    
    
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Dismiss keyboard upon clicking "return"
    [textField resignFirstResponder];
    return YES;
}


@end
