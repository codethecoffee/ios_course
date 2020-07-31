//
//  ViewController.m
//  Currency Conversion
//
//  Created by Suzy Lee on 7/31/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *euroValue;
@property (weak, nonatomic) IBOutlet UILabel *japanValue;
@property (weak, nonatomic) IBOutlet UILabel *poundValue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Create a new CRCurrencyRequest object on load
    _req = [[CRCurrencyRequest alloc]init];
    // Set this VC as the delegate of the CRCurrencyRequest
    _req.delegate = self;
    
}

- (IBAction)convertPressed:(id)sender {
    // Disable button on press
    _convertButton.enabled = NO;
    
    // Triggers the delegate function (currencyRequest)
    [_req start];
    
}

/**
 The delegate function that passes the currency info collected by CRCurrencyRequest to the delegate
 (a.k.a. this view controller))
 */
- (void) currencyRequest:(CRCurrencyRequest *)req retrievedCurrencies:(CRCurrencyResults *)currencies {
    double inputValue = [_inputField.text floatValue];
    double euroVal = inputValue * currencies.EUR;
    double japanVal = inputValue * currencies.JPY;
    double poundVal = inputValue * currencies.BGN;
    
    _euroValue.text = [NSString stringWithFormat:@"%.2f", euroVal];
    _japanValue.text = [NSString stringWithFormat:@"%.2f", japanVal];
    _poundValue.text = [NSString stringWithFormat:@"%.2f", poundVal];
        
    // Re-enable button once we get and update all the currency info
    _convertButton.enabled = YES;
    
}

@end
