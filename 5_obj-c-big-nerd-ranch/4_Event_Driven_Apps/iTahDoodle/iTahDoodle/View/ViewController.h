//
//  ViewController.h
//  iTahDoodle
//
//  Created by Suzy Lee on 8/17/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface ViewController : UIViewController <UITableViewDataSource>

@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

@property (nonatomic) AppDelegate *appDelegate;

- (void)addTask:(id)sender;
@end

