//
//  ItemDetailViewController.h
//  Homepwner
//
//  Created by Suzy Lee on 8/31/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Item;

NS_ASSUME_NONNULL_BEGIN

@interface ItemDetailViewController : UIViewController <UITextFieldDelegate>

// The current item displayed in the detail view
@property (nonatomic, weak) Item *currItem;

@end

NS_ASSUME_NONNULL_END
