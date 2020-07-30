//
//  ViewController.m
//  Unit Conversion
//
//  Created by Suzy Lee on 7/30/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectedUnit;
@property (weak, nonatomic) IBOutlet UILabel *outputField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

NSString* convertCmToFeet(double cm) {
    double ans = cm/30.48;
    return [NSString stringWithFormat:@"%.2f feet", ans];
}

NSString* convertCmToIn(double cm) {
    double ans = cm/2.54;
    return [NSString stringWithFormat:@"%.2f inches", ans];
}

NSString* convertCmToM(double cm) {
    double ans = cm/100;
    return [NSString stringWithFormat:@"%.2f meters", ans];
}

- (IBAction)pressConvert:(id)sender {
    NSMutableString *conversion = [NSMutableString new];
    
    double userInput = [_inputField.text doubleValue];
    
    switch (_selectedUnit.selectedSegmentIndex) {
        case 0:
        {
            NSString *ansInFeet = convertCmToFeet(userInput);
            [conversion setString:ansInFeet];
            break;
        }
        case 1:
        {
            NSString *ansInInches = convertCmToIn(userInput);
            [conversion setString:ansInInches];
            break;
        }
        case 2:
        {
            NSString *ansInMeters = convertCmToM(userInput);
            [conversion setString:ansInMeters];
            break;
        }
        default:
            NSLog(@"Invalid unit");
    };
    
    NSLog(@"Final value of conversion: %@", conversion);
    _outputField.text = conversion;
}

@end
