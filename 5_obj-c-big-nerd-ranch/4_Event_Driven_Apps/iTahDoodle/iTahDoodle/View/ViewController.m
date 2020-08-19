//
//  ViewController.m
//  iTahDoodle
//
//  Created by Suzy Lee on 8/17/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = [[AppDelegate alloc] init];
    // Create an empty array to store the tasks of the todo list
    [self.appDelegate setTasks:[NSMutableArray array]];
    
    // CGRect: A struct with an origin (x,y) and a size (width, height)
    // mainScreen: Property that returns the screen object representing the
    //             device's screen.
    // bounds: The bounding rectangle of the screen, measured in points.
    //         The value may change when the device rotates between orientations
    
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    
    // Define the frame rectangles of the three UI elements
    // CGRectMake() creates a CGRect from (x, y, width, height)
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height-100);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    
    // Create and configure the UITableView instance using frame
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    // Make the ViewController the table view's dataSource
    self.taskTable.dataSource = self;
    
    // Tell the table view which class to instantiate whenever it needs
    // to create a new cell
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // Create and configure the UITextField instance where new tasks are entered
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap Insert";
    
    // Create and configure the UIButton instance
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.insertButton.frame = buttonFrame;
    [self.insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    // Add all three of our UI elements to the current view as subviews
    [self.view addSubview:self.insertButton];
    [self.view addSubview:self.taskTable];
    [self.view addSubview:self.taskField];
    
    // Target-action callback
    // On pressing the insertBUtton, the addTask of appDelegate instance will be
    // triggered.
    [self.insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
}


#pragma mark - Actions
- (void)addTask:(id)sender{
    
    // Get the contents of the textField
    NSString *text = [self.taskField text];
    
    if ([text length] == 0) {
        return;
    }
    
    // Add the new task to self.tasks NSMutableArray
    [self.appDelegate.tasks addObject:text];
    // Reload the table so that the data shows up
    [_taskTable reloadData];
    
    
    // Clear out the text field and dismiss the keyboard
    [self.taskField setText:@""];
    [self.taskField resignFirstResponder];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Because this table view only has one section, the number of rows
    // in it is equal to the number of items in the tasks array
    return [self.appDelegate.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // To improve performance, this method first checks for an existing
    // cell object that we can reuse. If there isn't one, a new cell is
    // created.
    UITableViewCell *currCell = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    // Then we (re)configure the cell based on the model object.
    // in this case the tasks array.
    NSString *currTask = [self.appDelegate.tasks objectAtIndex:indexPath.row];
    currCell.textLabel.text = currTask;
    
    // Return the properly configured cell to the table view
    return currCell;
}


@end
