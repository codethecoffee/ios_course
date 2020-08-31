//
//  ViewController.m
//  Homepwner
//
//  Created by Suzy Lee on 8/30/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"
#import "ELMItemStore.h"
#import "TableViewCellCustomStyle.h"
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


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return @"Cheaper than $50";
    } else {
        return @"More expensive than $50";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"NUMBER OF ITEMS: %lu", [[[ELMItemStore sharedStore] allItems] count]);
    NSLog(@"Current sectin: %ld", (long)section);
    
    NSPredicate *lessThanFifty = [NSPredicate predicateWithFormat:@"valueInDollars < 50"];
    NSArray *cheapItems = [[[ELMItemStore sharedStore] allItems] filteredArrayUsingPredicate:lessThanFifty];
    
    NSPredicate *greaterThanFifty = [NSPredicate predicateWithFormat:@"valueInDollars >= 50"];
    NSArray *expensiveItems = [[[ELMItemStore sharedStore] allItems] filteredArrayUsingPredicate:greaterThanFifty];
    
    
    if (section == 0) {
        NSLog(@"Cheap items: %lu", [cheapItems count]);
        return [cheapItems count];
    } else {
        NSLog(@"Expensive items: %lu", [expensiveItems count]);
        return [expensiveItems count] + 1;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Two sections: (1) Less than $50, (2) Greater than $50
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCellCustomStyle *currCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TableViewCellCustomStyle"];
    
    NSPredicate *lessThanFifty = [NSPredicate predicateWithFormat:@"valueInDollars < 50"];
    NSArray *cheapItems = [[[ELMItemStore sharedStore] allItems] filteredArrayUsingPredicate:lessThanFifty];
    
    NSPredicate *greaterThanFifty = [NSPredicate predicateWithFormat:@"valueInDollars >= 50"];
    NSArray *expensiveItems = [[[ELMItemStore sharedStore] allItems] filteredArrayUsingPredicate:greaterThanFifty];
    NSArray *finalItems = [expensiveItems arrayByAddingObject:[[Item alloc] initWithItemName:@"No more items!"]];
    
    
    Item *currItem;
    if (indexPath.section == 0) {
        currItem = cheapItems[indexPath.row];

    } else {
        currItem = finalItems[indexPath.row];
    }
    
    currCell.textLabel.text = currItem.itemName;
    currCell.detailTextLabel.text = [NSString stringWithFormat:@"Cost: $%d", currItem.valueInDollars];
    
    return currCell;
}

@end
