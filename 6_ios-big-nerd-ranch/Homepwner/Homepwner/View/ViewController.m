//
//  ViewController.m
//  Homepwner
//
//  Created by Suzy Lee on 8/30/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"
#import "ELMItemStore.h"
#import "ItemDetailViewController.h"
#import "Item.h"
#import <UIKit/UIKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] init];
    
    // Set the instantiated tableView as the root view of this
    // table view controller
    self.tableView = tableView;
    
    UIButton *editButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    [self.tableView addSubview:editButton];
    
    for (int i = 0; i < 5; i++) {
        [[ELMItemStore sharedStore] createItem];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"NUMBER OF ITEMS: %lu", [[[ELMItemStore sharedStore] allItems] count]);
    return [[[ELMItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *currCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    
    NSArray *items = [[ELMItemStore sharedStore] allItems];
    Item *currItem = items[indexPath.row];
    
    currCell.textLabel.text = currItem.itemName;
    currCell.detailTextLabel.text = [NSString stringWithFormat:@"Cost: $%d", currItem.valueInDollars];
    
    return currCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Item *selectedItem = [[ELMItemStore sharedStore] allItems][indexPath.row];
    ItemDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemDetailView"];
    detailVC.currItem = selectedItem; // Pass in the selected item to the VC
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    // Always call the parent implementation before overriding!
    [super viewWillAppear:YES];
    
    // Reload the table view so that it updates with edited values
    [self.tableView reloadData];
}
@end
