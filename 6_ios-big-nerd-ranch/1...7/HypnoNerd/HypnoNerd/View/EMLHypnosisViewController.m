//
//  EMLHypnosisViewController.m
//  HypnoNerd
//
//  Created by Suzy Lee on 8/24/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "EMLHypnosisViewController.h"
#import "EMLHypnosisView.h"

@interface EMLHypnosisViewController ()
@end

@implementation EMLHypnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Hyponsis view is loaded!");
    
    
}


/**
 Set the root of the view controller as an instance of the EMLHypnosisView
 */
- (void)loadView {
    EMLHypnosisView *backgroundView = [[EMLHypnosisView alloc] init];
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    
    // Change placeholder text in text field
    textField.placeholder = @"Hypnotize me";
    
    // Modify the keyboard's return key type
    // Note that this doesn't implement the return key's
    // functionality; you have to code that yourself
    textField.returnKeyType = UIReturnKeyDone;
    
    // Set the border on the text field and add it to the
    // backgroundView as a sub-view
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    
    
    [backgroundView addSubview:textField];
    
    // Set backgroundView as the root view of this view
    self.view = backgroundView;
}

- (void)drawLabelsWithString:(NSString *)text {
    NSLog(@"The text: %@", text);
    
    int deviceWidth = self.view.bounds.size.width;
    int deviceHeight = self.view.bounds.size.height;
    
    for (int i = 0; i < 20; i++) {
        UILabel *currLabel = [[UILabel alloc] init];
        currLabel.text = text;
        [currLabel sizeToFit]; // Resizes label relative to text
        currLabel.textColor = [UIColor whiteColor];
        
        // Add random origin point for each label
        int x = arc4random() % deviceWidth;
        int y = arc4random() % deviceHeight;
        // We can't directly reassign currLabel.frame.origin
        // so let's create a new frame and update that
        CGRect newFrame = currLabel.frame;
        newFrame.origin = CGPointMake(x, y);
        currLabel.frame = newFrame;

        [self.view addSubview:currLabel];
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@", textField.text);
    [self drawLabelsWithString:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}



@end
