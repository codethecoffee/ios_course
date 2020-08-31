//
//  DateChangeViewController.m
//  Homepwner
//
//  Created by Suzy Lee on 8/31/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "DateChangeViewController.h"
#import "Item.h"

@interface DateChangeViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DateChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selectDate:(UIDatePicker *)sender {
    NSDate *selectedDate = sender.date;
    self.currItem.dateCreated = selectedDate;
    NSLog(@"Value of self.selectedDate is now: %@", self.currItem.dateCreated);
    
}

@end
