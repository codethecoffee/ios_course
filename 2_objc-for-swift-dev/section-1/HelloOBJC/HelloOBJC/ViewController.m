//
//  ViewController.m
//  HelloOBJC
//
//  Created by Suzy Lee on 7/28/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sayHello:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"안녕" message: @"You said hello in Korean!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"CLOSE" style:UIAlertActionStyleCancel handler:nil];
    
    // Attach the UIAlertAction to the instance of alert
    [alert addAction:closeAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
