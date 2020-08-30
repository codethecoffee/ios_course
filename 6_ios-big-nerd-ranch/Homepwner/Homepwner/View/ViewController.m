//
//  ViewController.m
//  Homepwner
//
//  Created by Suzy Lee on 8/30/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"
#import "ELMItemStore.h"
#import "Item.h"
#import <UIKit/UIKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    
    for (int i = 0; i < 5; i++) {
        [[ELMItemStore sharedStore] createItem];
    }
    
    NSLog(@"Loaded properly!");

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"table view is about to appear!!!");
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"NUMBER OF ITEMS: %lu", [[[ELMItemStore sharedStore] allItems] count]);
    return [[[ELMItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *currCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    
    NSArray *items = [[ELMItemStore sharedStore] allItems];
    NSLog(@"Trying to add a new table cell!");
    Item *currItem = items[indexPath.row];
    
    currCell.textLabel.text = currItem.itemName;
    currCell.detailTextLabel.text = [NSString stringWithFormat:@"Cost: $%d", currItem.valueInDollars];
    
    return currCell;
}

@end
