//
//  ItemDetailViewController.m
//  Homepwner
//
//  Created by Suzy Lee on 8/31/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "DateChangeViewController.h"
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
    _valueField.keyboardType = UIKeyboardTypeNumberPad;
    NSLog(@"CURRENT DATE: %@", self.currItem.dateCreated);
    
    // Add a tap recognizer so that you can dismiss the number keyboard
    // upon tapping anywhere on the view
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer addTarget:self action:@selector(didTapView)];
    [self.view addGestureRecognizer:tapRecognizer];
    
}

# pragma mark - Navigation

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

- (IBAction)changeDate:(id)sender {
    DateChangeViewController *dateVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DateChangeView"];
    dateVC.currItem = self.currItem;
    [self.navigationController pushViewController:dateVC animated:YES];
    
}



#pragma mark - UITapGestureRecognizer
- (void)didTapView {
    // Dismiss any keyboard that is currently the first responder on the view
    [self.view endEditing:YES];
    
    // Note: Setting endEditing can be more elegant than calling resignFirstResponder
    // for every individual textField; this property applies to ALL keyboards
    // that could potentially be open on self.view
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Dismiss keyboard upon clicking "return"
    [textField resignFirstResponder];
    return YES;
}



@end
