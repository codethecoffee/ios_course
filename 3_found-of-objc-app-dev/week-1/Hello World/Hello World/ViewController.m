//
//  ViewController.m
//  Hello World
//
//  Created by Suzy Lee on 7/29/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *heightText;
@property (weak, nonatomic) IBOutlet UIButton *buttonText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _heightText.text = @"5 foot 3";
    [_buttonText setTitle:@"Convert height to cm!" forState: UIControlStateNormal];
    
}

- (IBAction)pressHelloButton:(UIButton *)sender {
    int heightFeet = 5;
    int heightInches = 3;
    double heightCm = ((heightFeet * 12.0) + heightInches)*2.54;
    
    _heightText.text = [NSString stringWithFormat:@"%fcm", heightCm];
}

@end
